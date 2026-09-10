[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$repo = 'edburns/dd-3056167-01-windows'
$parentIssue = 1
$expectedTaskCount = 2
$selectedIssueType = ''
$logDirectory = 'C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008'
$bodyDirectory = Join-Path $logDirectory 'issue-bodies'
$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'
$resultPath = Join-Path $logDirectory 'stage-20-result.json'
$bodyVerifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1'
$baselineIds = [long[]]@()

$drafts = @(
    [ordered]@{
        implementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'
        title = '1. Implement Fibonacci with unit and isolated CLI coverage'
        bodyFile = 'issue-bodies/01-1-implement-fibonacci-body.md'
    },
    [ordered]@{
        implementationSubsection = '2. Add factorial and operation dispatch'
        title = '2. Add factorial and operation dispatch'
        bodyFile = 'issue-bodies/02-2-add-factorial-dispatch-body.md'
    }
)

function Write-AtomicJson {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][AllowEmptyCollection()][object]$Value
    )

    $temporaryPath = "$Path.$([Guid]::NewGuid().ToString('N')).tmp"
    try {
        $json = ConvertTo-Json -InputObject $Value -Depth 10
        [IO.File]::WriteAllText($temporaryPath, "$json`n", [Text.UTF8Encoding]::new($false))
        [IO.File]::Move($temporaryPath, $Path, $true)
    }
    finally {
        if (Test-Path -LiteralPath $temporaryPath) {
            Remove-Item -LiteralPath $temporaryPath
        }
    }
}

function Read-CreationLedger {
    $parsed = [IO.File]::ReadAllText($ledgerPath) |
        ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Creation ledger JSON root must be an array.'
    }

    $ledger = [object[]]$parsed
    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Creation ledger must not contain nested array entries.'
    }
    return $ledger
}

function Write-CreationLedger {
    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)
    Write-AtomicJson -Path $ledgerPath -Value ([object[]]$Ledger)
}

function Get-NormalizedChildren {
    $childrenOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" --paginate --slurp 2>&1
    $childrenExitCode = $LASTEXITCODE
    if ($childrenExitCode -ne 0) {
        throw "Unable to query parent children: $($childrenOutput | Out-String)"
    }

    $normalizedOutput = ($childrenOutput | Out-String) |
        jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'
    $jqExitCode = $LASTEXITCODE
    if ($jqExitCode -ne 0) {
        throw "Unable to normalize parent children response: $($normalizedOutput | Out-String)"
    }

    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate
    if ($null -eq $parsed) {
        return @()
    }
    if ($parsed -isnot [System.Array]) {
        throw 'Normalized parent children response must be an array.'
    }
    return [object[]]$parsed
}

function Set-LedgerFlag {
    param(
        [Parameter(Mandatory)][long]$IssueId,
        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Flag,
        [Parameter(Mandatory)][bool]$Value
    )

    $ledger = @(Read-CreationLedger)
    $entry = $ledger | Where-Object { [long]$_.id -eq $IssueId } | Select-Object -First 1
    if ($null -eq $entry) {
        throw "Issue ID $IssueId was not found in the creation ledger."
    }
    $entry.$Flag = $Value
    Write-CreationLedger -Ledger ([object[]]$ledger)
}

function Invoke-BodyVerifier {
    param(
        [Parameter(Mandatory)][int]$IssueNumber,
        [Parameter(Mandatory)][string]$BodyPath
    )

    return & $bodyVerifier `
        -Repository $repo `
        -IssueNumber $IssueNumber `
        -ExpectedBodyPath $BodyPath `
        -MaxAttempts 6 `
        -DelaySeconds 5 `
        -DiagnosticPath (Join-Path $logDirectory "issue-$IssueNumber-body-verification-failure.json")
}

function Reconcile-And-Fail {
    param([Parameter(Mandatory)][string]$OperationError)

    try {
        $serverChildren = @(Get-NormalizedChildren)
        $linkedIds = [Collections.Generic.HashSet[long]]::new()
        foreach ($child in $serverChildren) {
            [void]$linkedIds.Add([long]$child.id)
        }

        $ledger = @(Read-CreationLedger)
        foreach ($entry in $ledger) {
            $entry.linked = $linkedIds.Contains([long]$entry.id)
        }
        Write-CreationLedger -Ledger ([object[]]$ledger)
    }
    catch {
        $OperationError = "$OperationError Reconciliation error: $($_.Exception.Message)"
        $ledger = @(Read-CreationLedger)
    }

    $result = [ordered]@{
        schemaVersion = 1
        status = 'failed'
        ledgerFile = 'creation-ledger.json'
        operationError = $OperationError
    }
    Write-AtomicJson -Path $resultPath -Value $result

    Write-Error $OperationError
    if ($ledger.Count -eq 0) {
        Write-Output 'No issues were created; no cleanup is required.'
    }
    else {
        $ledger |
            Select-Object number, title, url, bodyFile, body_verified, linked |
            Format-Table -AutoSize |
            Out-String |
            Write-Output
        foreach ($entry in $ledger) {
            Write-Output "gh issue delete $($entry.number) --repo `"$repo`" --yes"
        }
        Write-Output 'The operation did not complete and no automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.'
    }
    exit 1
}

Write-CreationLedger -Ledger ([object[]]@())
Write-AtomicJson -Path $resultPath -Value ([ordered]@{
    schemaVersion = 1
    status = 'in_progress'
    ledgerFile = 'creation-ledger.json'
    operationError = $null
})

foreach ($draft in $drafts) {
    $bodyPath = Join-Path $logDirectory $draft.bodyFile
    try {
        $arguments = @(
            'api',
            "repos/$repo/issues",
            '-X', 'POST',
            '-f', "title=$($draft.title)",
            '-F', "body=@$bodyPath"
        )
        if (-not [string]::IsNullOrEmpty($selectedIssueType)) {
            $arguments += @('-f', "type=$selectedIssueType")
        }
        $arguments += @('--jq', '{id,number,node_id,html_url,title}')

        $createOutput = & gh @arguments 2>&1
        $createExitCode = $LASTEXITCODE
        if ($createExitCode -ne 0) {
            throw "Create failed for '$($draft.implementationSubsection)': $($createOutput | Out-String)"
        }
        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json

        $ledger = @(Read-CreationLedger)
        $ledger += [pscustomobject][ordered]@{
            implementationSubsection = $draft.implementationSubsection
            bodyFile = $draft.bodyFile
            id = [long]$createdIssue.id
            number = [int]$createdIssue.number
            title = [string]$createdIssue.title
            url = [string]$createdIssue.html_url
            body_verified = $false
            linked = $false
        }
        Write-CreationLedger -Ledger ([object[]]$ledger)

        $null = Invoke-BodyVerifier -IssueNumber $createdIssue.number -BodyPath $bodyPath
        Set-LedgerFlag -IssueId $createdIssue.id -Flag body_verified -Value $true

        $linkSucceeded = $false
        $lastLinkError = ''
        for ($attempt = 1; $attempt -le 3; $attempt++) {
            $payload = @{ sub_issue_id = [long]$createdIssue.id } | ConvertTo-Json -Compress
            $linkOutput = $payload | & gh api "repos/$repo/issues/$parentIssue/sub_issues" -X POST --input - 2>&1
            $linkExitCode = $LASTEXITCODE
            if ($linkExitCode -eq 0) {
                $linkSucceeded = $true
                break
            }
            $lastLinkError = $linkOutput | Out-String
            if ($attempt -lt 3) {
                Start-Sleep -Seconds 2
            }
        }
        if (-not $linkSucceeded) {
            throw "Link failed for issue #$($createdIssue.number) after 3 attempts: $lastLinkError"
        }
        Set-LedgerFlag -IssueId $createdIssue.id -Flag linked -Value $true
    }
    catch {
        Reconcile-And-Fail -OperationError $_.Exception.Message
    }
}

try {
    $ledger = @(Read-CreationLedger)
    if ($ledger.Count -ne $expectedTaskCount) {
        throw "Expected $expectedTaskCount ledger entries; found $($ledger.Count)."
    }

    $serverChildren = @(Get-NormalizedChildren)
    if ($serverChildren.Count -ne ($baselineIds.Count + $ledger.Count)) {
        throw "Parent child count did not increase by $($ledger.Count): baseline=$($baselineIds.Count), final=$($serverChildren.Count)."
    }

    $newChildren = @($serverChildren | Where-Object { $baselineIds -notcontains [long]$_.id })
    if ($newChildren.Count -ne $ledger.Count) {
        throw "Expected $($ledger.Count) newly linked children; found $($newChildren.Count)."
    }
    for ($index = 0; $index -lt $ledger.Count; $index++) {
        if ([long]$newChildren[$index].id -ne [long]$ledger[$index].id) {
            throw "New child order differs from plan order at position $($index + 1)."
        }
        if (-not [bool]$ledger[$index].linked) {
            throw "Ledger entry for issue #$($ledger[$index].number) is not marked linked."
        }

        $bodyPath = Join-Path $logDirectory $ledger[$index].bodyFile
        $issue = Invoke-BodyVerifier -IssueNumber $ledger[$index].number -BodyPath $bodyPath
        if ([string]$issue.state -cne 'open') {
            throw "Issue #$($ledger[$index].number) is not open."
        }
        if (@($issue.assignees).Count -ne 0) {
            throw "Issue #$($ledger[$index].number) unexpectedly has assignees."
        }
        if (-not [string]::IsNullOrEmpty($selectedIssueType) -and [string]$issue.type.name -cne $selectedIssueType) {
            throw "Issue #$($ledger[$index].number) does not have type $selectedIssueType."
        }
    }

    Write-AtomicJson -Path $resultPath -Value ([ordered]@{
        schemaVersion = 1
        status = 'complete'
        ledgerFile = 'creation-ledger.json'
        operationError = $null
    })
    Read-CreationLedger | ConvertTo-Json -Depth 10
}
catch {
    Reconcile-And-Fail -OperationError "Postcondition verification failed: $($_.Exception.Message)"
}
