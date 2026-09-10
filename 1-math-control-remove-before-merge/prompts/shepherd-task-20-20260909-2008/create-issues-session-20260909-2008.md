# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `21826f6e-8a1f-4a58-a7bb-0ed9c8a195c7`  
> - **Started:** 9/9/2026, 8:08:43 PM  
> - **Duration:** 2m 6s  
> - **Exported:** 9/9/2026, 8:10:49 PM  

---

<sub>4s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: 61e0ba90-97d8-4ee8-b32c-90a2ce3ec2a4
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3056167-01-windows
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008
- DRAFT_VALIDATOR: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1
- ISSUE_BODY_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.


---

<sub>7s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>9s</sub>

### Copilot

I’m validating the campaign inputs, plan structure, bundled issue conventions, and GitHub preconditions before any mutation.

---

<sub>25s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>22s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research for that task.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>22s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge.**

C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge

```
campaign-lessons.md
math-tool-ignorance-reduction-plan.md
prompts
shepherd-campaign.json
shepherd-test-experiment.json
```


---

<sub>24s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1

<details>
<summary>60 lines</summary>

```
# shepherd-task-version: 1.0.2
<#
.SYNOPSIS
    Validates persisted stage-20 issue bodies before GitHub mutation.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BodyDirectory,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$ExpectedCount,

    [Parameter(Mandatory)]
    [ValidateSet('off', 'campaign')]
    [string]$LessonPropagation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $BodyDirectory -PathType Container)) {
    throw "Stage-20 body directory does not exist: $BodyDirectory"
}

$bodyFiles = @(
    Get-ChildItem -LiteralPath $BodyDirectory -Filter '*-body.md' -File |
        Where-Object { $_.Name -notlike '*-observed-body.md' } |
        Sort-Object Name
)
if ($bodyFiles.Count -ne $ExpectedCount) {
    throw "Expected $ExpectedCount persisted stage-20 body files; found $($bodyFiles.Count)."
}

$requiredHeadings = @(
    '## Campaign context and required reading',
    '## Branch and execution order',
    '## Implement',
    '## Completion gates',
    '## Out of scope'
)

foreach ($bodyFile in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($bodyFile.FullName)
    $lines = [System.IO.File]::ReadAllLines($bodyFile.FullName)
    if ([string]::IsNullOrWhiteSpace($text) -or $text -notmatch "`r?`n" -or $lines.Count -le 1) {
        throw "Persisted issue body must contain physical Markdown lines: $($bodyFile.FullName)"
    }

    $firstNonblank = $lines | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1
    if ($firstNonblank -notmatch '^##\s+\S') {
        throw "Persisted issue body must begin with a level-two heading: $($bodyFile.FullName)"
    }

    foreach ($heading in $requiredHeadings) {
        if ($lines -cnotcontains $heading) {
            throw "Persisted issue body is missing the physical heading '$heading': $($bodyFile.FullName)"
        }
    }

    $hasCampaignLessons = $lines -ccontains '## Campaign lessons (REQUIRED)'
    if ($LessonPropagation -eq 'campaign' -and -not $hasCampaignLessons) {
        throw "Treatment issue body is missing its campaign-lessons heading: $($bodyFile.FullName)"
    }
    if ($LessonPropagation -eq 'off' -and $hasCampaignLessons) {
        throw "Control issue body unexpectedly contains a campaign-lessons heading: $($bodyFile.FullName)"
    }
}

$bodyFiles
```

</details>


---

<sub>25s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

<details>
<summary>166 lines</summary>

```
# shepherd-task-version: 1.0.2
<#
.SYNOPSIS
    Fetches a GitHub issue through REST and verifies its body against a file.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$IssueNumber,

    [Parameter(Mandatory)]
    [string]$ExpectedBodyPath,

    [ValidateRange(1, 100)]
    [int]$MaxAttempts = 6,

    [ValidateRange(0, 300)]
    [int]$DelaySeconds = 5,

    [string]$DiagnosticPath,

    [string]$GitHubCli = 'gh'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

function ConvertTo-NormalizedLineEndings {
    param([AllowEmptyString()][string]$Text)
    return $Text -replace "`r`n|`r", "`n"
}

function Test-EquivalentBody {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ($Actual -ceq $Expected) {
        return $true
    }
    if ($Actual.EndsWith("`n") -and $Actual.Substring(0, $Actual.Length - 1) -ceq $Expected) {
        return $true
    }
    if ($Expected.EndsWith("`n") -and $Expected.Substring(0, $Expected.Length - 1) -ceq $Actual) {
        return $true
    }
    return $false
}

function Get-Sha256 {
    param([AllowEmptyString()][string]$Text)

    $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($Text)
    return [Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Get-FirstDifference {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    $limit = [Math]::Min($Actual.Length, $Expected.Length)
    $offset = 0
    while ($offset -lt $limit -and $Actual[$offset] -ceq $Expected[$offset]) {
        $offset++
    }
    if ($offset -eq $limit -and $Actual.Length -eq $Expected.Length) {
        return $null
    }

    $prefix = $Expected.Substring(0, [Math]::Min($offset, $Expected.Length))
    $line = ([regex]::Matches($prefix, "`n").Count) + 1
    $lastNewline = $prefix.LastIndexOf("`n", [StringComparison]::Ordinal)
    $column = if ($lastNewline -lt 0) { $offset + 1 } else { $offset - $lastNewline }
    return [ordered]@{
        offset = $offset
        line = $line
        column = $column
    }
}

function Test-TerminalGitHubFailure {
    param([string]$Message)
    return $Message -match '(?i)(HTTP\s+(401|403)|authentication|not authorized|resource not accessible)'
}

function Write-Diagnostic {
    param(
        [string]$Reason,
        [int]$Attempts,
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        return
    }

    $parent = Split-Path -Parent $DiagnosticPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and
        -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $diagnostic = [ordered]@{
        schemaVersion = 1
        repository = $Repository
        issueNumber = $IssueNumber
        endpoint = "repos/$Repository/issues/$IssueNumber"
        attempts = $Attempts
        observedAt = (Get-Date).ToUniversalTime().ToString('o')
        reason = $Reason
        expectedLength = $Expected.Length
        actualLength = $Actual.Length
        expectedSha256 = Get-Sha256 $Expected
        actualSha256 = Get-Sha256 $Actual
        firstDifference = Get-FirstDifference -Actual $Actual -Expected $Expected
    }
    $diagnostic | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $DiagnosticPath -Encoding utf8NoBOM
}

if (-not (Test-Path -LiteralPath $ExpectedBodyPath -PathType Leaf)) {
    throw "Expected issue body file not found: $ExpectedBodyPath"
}

$expected = ConvertTo-NormalizedLineEndings (
    Get-Content -LiteralPath $ExpectedBodyPath -Raw
)
$lastReason = ''
$lastActual = ''
$previousConsoleOutputEncoding = [Console]::OutputEncoding
$previousOutputEncoding = $OutputEncoding
$utf8Encoding = [System.Text.UTF8Encoding]::new($false)

try {
    [Console]::OutputEncoding = $utf8Encoding
    $OutputEncoding = $utf8Encoding

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $output = (& $GitHubCli api "repos/$Repository/issues/$IssueNumber" 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            $lastReason = "GitHub REST request failed with exit code $exitCode."
            if (Test-TerminalGitHubFailure $output) {
                Write-Diagnostic -Reason $lastReason -Attempts $attempt -Actual '' -Expected $expected
                throw "Unable to fetch issue #$IssueNumber from ${Repository}: $output"
            }
        }
        else {
            try {
                $issue = $output | ConvertFrom-Json
                $lastActual = ConvertTo-NormalizedLineEndings ([string]$issue.body)
                if (Test-EquivalentBody -Actual $lastActual -Expected $expected) {
                    return $issue
                }
                $lastReason = 'GitHub issue body differs from the persisted draft.'
            }
            catch {
                $lastReason = "GitHub REST response was invalid JSON: $($_.Exception.Message)"
            }
        }

        if ($attempt -lt $MaxAttempts) {
            Write-Warning "$lastReason Retrying issue #$IssueNumber body verification ($attempt/$MaxAttempts)."
            if ($DelaySeconds -gt 0) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }

    Write-Diagnostic -Reason $lastReason -Attempts $MaxAttempts -Actual $lastActual -Expected $expected
    $diagnosticSuffix = if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        ''
    }
    else {
        " Diagnostic: $DiagnosticPath"
    }
    throw "Issue #$IssueNumber body verification failed after $MaxAttempts attempts. $lastReason$diagnosticSuffix"
}
finally {
    $OutputEncoding = $previousOutputEncoding
    [Console]::OutputEncoding = $previousConsoleOutputEncoding
}
```

</details>


---

<sub>26s</sub>

### `powershell`

**Validate paths, branch, and remote configuration**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $logDir='C:\\Users\\edburns\\workareas\\dd-3056167-01-windows-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260909-2008'; if (-not [IO.Path]::IsPathRooted($logDir)) { throw 'LOG_DIRECTORY is not absolute' }; if (-not (Test-Path -LiteralPath $logDir -PathType Container)) { throw 'LOG_DIRECTORY does not exist' }; $probe=Join-Path $logDir '.write-probe'; [IO.File]::WriteAllText($probe,'ok'); Remove-Item -LiteralPath $probe; New-Item -ItemType Directory -Force -Path (Join-Path $logDir 'issue-bodies') | Out-Null; git remote -v; git branch --show-current; git show-ref --verify --quiet refs/heads/experiment/shepherd-control; $branchLocal=$LASTEXITCODE; git show-ref --verify --quiet refs/remotes/origin/experiment/shepherd-control; $branchRemote=$LASTEXITCODE; Write-Output \"LOCAL_BRANCH_EXIT=$branchLocal REMOTE_BRANCH_EXIT=$branchRemote\"; git remote get-url origin",
  "description": "Validate paths, branch, and remote configuration"
}
```

</details>

<details>
<summary>6 lines</summary>

```
origin	git@github.com:edburns/dd-3056167-01-windows.git (fetch)
origin	git@github.com:edburns/dd-3056167-01-windows.git (push)
experiment/shepherd-control
LOCAL_BRANCH_EXIT=0 REMOTE_BRANCH_EXIT=0
git@github.com:edburns/dd-3056167-01-windows.git
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>40s</sub>

### `powershell`

**Read campaign plan from base branch**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git --no-pager show \"experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md\"",
  "description": "Read campaign plan from base branch"
}
```

</details>

<details>
<summary>39 lines</summary>

```
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>41s</sub>

### `powershell`

**Read manifest and verify lessons file**

<details>
<summary>Arguments</summary>

```json
{
  "command": "git --no-pager show \"experiment/shepherd-control:1-math-control-remove-before-merge/shepherd-campaign.json\"; $campaignExit=$LASTEXITCODE; if ($campaignExit -ne 0) { exit $campaignExit }; git cat-file -e \"experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md\"; $lessonsExit=$LASTEXITCODE; Write-Output \"CAMPAIGN_EXIT=$campaignExit LESSONS_EXIT=$lessonsExit\"; exit $lessonsExit",
  "description": "Read manifest and verify lessons file"
}
```

</details>

<details>
<summary>18 lines</summary>

```
{
  "schemaVersion": 1,
  "campaignId": "61e0ba90-97d8-4ee8-b32c-90a2ce3ec2a4",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3056167-01-windows",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.2",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-10T03:08:38Z"
}
CAMPAIGN_EXIT=0 LESSONS_EXIT=0
<shellId: 2 completed with exit code 0>
```

</details>


---

<sub>41s</sub>

### `powershell`

**Validate GitHub parent, type, and baseline children**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3056167-01-windows'; $parent=1; $repoOutput=& gh api \"repos/$repo\" 2>&1; $repoExit=$LASTEXITCODE; if($repoExit -ne 0){throw \"Repository lookup failed: $($repoOutput|Out-String)\"}; $repoJson=($repoOutput|Out-String)|ConvertFrom-Json; $parentOutput=& gh api \"repos/$repo/issues/$parent\" 2>&1; $parentExit=$LASTEXITCODE; if($parentExit -ne 0){throw \"Parent lookup failed: $($parentOutput|Out-String)\"}; $parentJson=($parentOutput|Out-String)|ConvertFrom-Json; $childrenOutput=& gh api \"repos/$repo/issues/$parent/sub_issues\" --paginate --slurp 2>&1; $childrenExit=$LASTEXITCODE; if($childrenExit -ne 0){throw \"Child lookup failed: $($childrenOutput|Out-String)\"}; $normalizedOutput=($childrenOutput|Out-String) | jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $jqExit=$LASTEXITCODE; if($jqExit -ne 0){throw 'Child response normalization failed'}; $children=@(($normalizedOutput|Out-String)|ConvertFrom-Json); $selected=''; if($repoJson.owner.type -eq 'Organization'){ $typesOutput=& gh api \"orgs/$($repoJson.owner.login)/issue-types\" 2>&1; $typesExit=$LASTEXITCODE; if($typesExit -ne 0){throw \"Issue type lookup failed: $($typesOutput|Out-String)\"}; $types=($typesOutput|Out-String)|ConvertFrom-Json; if(@($types|Where-Object{$_.name -ceq 'Task' -and $_.is_enabled -eq $true}).Count -gt 0){$selected='Task'} } elseif($repoJson.owner.type -ne 'User'){throw \"Unrecognized owner type: $($repoJson.owner.type)\"}; [ordered]@{defaultBranch=$repoJson.default_branch;ownerLogin=$repoJson.owner.login;ownerType=$repoJson.owner.type;parentNumber=$parentJson.number;parentState=$parentJson.state;parentRepository=$repoJson.full_name;selectedIssueType=$selected;baselineChildren=@($children|ForEach-Object{[ordered]@{id=$_.id;number=$_.number;title=$_.title}})}|ConvertTo-Json -Depth 6",
  "description": "Validate GitHub parent, type, and baseline children"
}
```

</details>

<details>
<summary>11 lines</summary>

```
{
  "defaultBranch": "main",
  "ownerLogin": "edburns",
  "ownerType": "User",
  "parentNumber": 1,
  "parentState": "open",
  "parentRepository": "edburns/dd-3056167-01-windows",
  "selectedIssueType": "",
  "baselineChildren": []
}
<shellId: 3 completed with exit code 0>
```

</details>


---

<sub>44s</sub>

### Copilot

Preconditions passed: the parent is open, the topic branch differs from `main`, the manifest matches the campaign, both implementation decisions are concretely resolved, and exactly two direct tasks exist. The user-owned repository has no organization issue types, so children will be created **without an issue type**. I’m persisting both complete specifications and validating them before the first GitHub mutation.

---

<sub>1m 6s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260909-2008/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+Apply these resolved decisions:\n+\n+- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass the runner or change the pinned Pester version.\n+- Direct CLI execution must write exactly one result line to stdout in the form `Fibonacci(N) = value`. Functions return numeric values with no incidental output. Inputs are non-negative integers.\n+- Production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- Research established no additional spike-derived implementation pattern for this task; implement from the plan and repository conventions rather than using research artifact code.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch.\n+\n+This is task 1 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin work until this issue is assigned. Task 2 begins only after this task is merged.\n+\n+## Implement\n+\n+Create repository-root `math-tool.ps1` with:\n+\n+- A script parameter named `N` accepting non-negative integer input.\n+- A pure `Get-Fibonacci` function that returns the numeric Fibonacci value without writing progress, labels, or other incidental output.\n+- Direct script execution that invokes the function and writes exactly `Fibonacci(N) = value` followed only by the normal line terminator.\n+- Correct behavior for `N=0`, `N=1`, and representative small non-negative values.\n+\n+Create repository-root `math-tool.Tests.ps1` with:\n+\n+- Dot-sourced unit tests that call `Get-Fibonacci` and assert numeric return values.\n+- Isolated child-`pwsh` process tests that execute `math-tool.ps1` as a CLI and assert its exact stdout contract.\n+- Coverage for `N=0`, `N=1`, and at least one representative small value greater than 1 in both the function and CLI surfaces.\n+\n+Keep the implementation deterministic, objective, and small.\n+\n+## Completion gates\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; it must exit zero.\n+- Confirm the pinned pull-request workflow passes without changing or bypassing its Pester 5.7.1 setup.\n+- Unit tests must distinguish the numeric function result from formatted CLI output and fail if the function emits incidental output.\n+- Child-process tests must fail on extra stdout lines, altered labels, spacing changes, or a result other than the exact `Fibonacci(N) = value` contract.\n+- The regression set must include exact expected results for `N=0`, `N=1`, and a representative small value greater than 1.\n+- Verify the pull request contains only the math tool and directly related tests unless a narrowly necessary repository-owned test-runner adjustment is explicitly justified.\n+\n+## Out of scope\n+\n+- Do not implement factorial or operation dispatch; those belong to task 2.\n+- Do not modify unrelated scripts, workflows, documentation, or dependencies.\n+- Do not replace the repository-owned test runner, loosen assertions, or alter the pinned Pester version.\n+- Do not copy or adapt spike source code or test helpers.\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260909-2008/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+Apply these resolved decisions:\n+\n+- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass the runner or change the pinned Pester version.\n+- Direct CLI execution must write exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation. Functions return numeric values with no incidental output. Inputs are non-negative integers.\n+- This task depends on task 1 having been merged. Preserve its Fibonacci function, CLI behavior, and tests while extending repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- Research established no additional spike-derived implementation pattern for this task; implement from the plan and repository conventions rather than using research artifact code.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch.\n+\n+This is task 2 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin work until this issue is assigned, and only after task 1 has been merged into the base branch.\n+\n+## Implement\n+\n+Extend repository-root `math-tool.ps1` with:\n+\n+- A pure `Get-Factorial` function that returns the numeric factorial value without writing progress, labels, or other incidental output.\n+- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.\n+- Direct execution that writes exactly one line: `Fibonacci(N) = value` for the Fibonacci operation or `Factorial(N) = value` for the factorial operation.\n+- Correct factorial behavior for `N=0`, `N=1`, and representative small non-negative values.\n+- Full preservation of task 1's Fibonacci behavior.\n+\n+Extend repository-root `math-tool.Tests.ps1` with objective, small coverage for:\n+\n+- Direct calls to `Get-Factorial`, asserting numeric return values and no incidental output.\n+- Isolated child-`pwsh` execution of factorial dispatch, asserting exact stdout.\n+- Regression coverage for the existing Fibonacci function and CLI operation.\n+- Factorial edge cases `N=0` and `N=1`, plus at least one representative small value greater than 1.\n+\n+Follow the repository's established test style from the merged task 1 implementation. Implement production behavior and tests from scratch rather than using research artifact code.\n+\n+## Completion gates\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; the combined regression suite must exit zero.\n+- Confirm the pinned pull-request workflow passes without changing or bypassing its Pester 5.7.1 setup.\n+- Unit tests must distinguish numeric function results from formatted CLI output and fail if either function emits incidental output.\n+- Child-process tests must assert both operation paths and fail on extra stdout lines, altered labels, spacing changes, or incorrect values.\n+- Factorial assertions must include `0! = 1`, `1! = 1`, and a representative small value greater than 1.\n+- Fibonacci regression assertions must retain edge and representative-value coverage from task 1.\n+- Dispatch tests must prove that selecting factorial does not invoke or label Fibonacci behavior, and selecting Fibonacci preserves the original contract.\n+- Verify both functions use the same non-negative-integer input contract and that the pull request remains limited to the math tool and its directly related tests.\n+\n+## Out of scope\n+\n+- Do not add operations other than `fibonacci` and `factorial`.\n+- Do not redesign the script into a module, add unrelated validation policy, or broaden the CLI beyond the resolved contract.\n+- Do not modify unrelated scripts, workflows, documentation, or dependencies.\n+- Do not replace the repository-owned test runner, loosen assertions, or alter the pinned Pester version.\n+- Do not copy or adapt spike source code or test helpers.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\issue-bodies\01-1-implement-fibonacci-body.md, C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\issue-bodies\02-2-add-factorial-dispatch-body.md
```


---

<sub>1m 12s</sub>

### `powershell`

**Validate persisted issue body drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $validator='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $bodyDir='C:\\Users\\edburns\\workareas\\dd-3056167-01-windows-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260909-2008\\issue-bodies'; & $validator -BodyDirectory $bodyDir -ExpectedCount 2 -LessonPropagation off | Select-Object -ExpandProperty FullName",
  "description": "Validate persisted issue body drafts"
}
```

</details>

```
C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\issue-bodies\01-1-implement-fibonacci-body.md
C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\issue-bodies\02-2-add-factorial-dispatch-body.md
<shellId: 4 completed with exit code 0>
```


---

<sub>1m 43s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260909-2008/run-stage20.ps1\n+[CmdletBinding()]\n+param()\n+\n+Set-StrictMode -Version Latest\n+$ErrorActionPreference = 'Stop'\n+$PSNativeCommandUseErrorActionPreference = $false\n+\n+$repo = 'edburns/dd-3056167-01-windows'\n+$parentIssue = 1\n+$expectedTaskCount = 2\n+$selectedIssueType = ''\n+$logDirectory = 'C:\\Users\\edburns\\workareas\\dd-3056167-01-windows-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260909-2008'\n+$bodyDirectory = Join-Path $logDirectory 'issue-bodies'\n+$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'\n+$resultPath = Join-Path $logDirectory 'stage-20-result.json'\n+$bodyVerifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'\n+$baselineIds = [long[]]@()\n+\n+$drafts = @(\n+    [ordered]@{\n+        implementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        title = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        bodyFile = 'issue-bodies/01-1-implement-fibonacci-body.md'\n+    },\n+    [ordered]@{\n+        implementationSubsection = '2. Add factorial and operation dispatch'\n+        title = '2. Add factorial and operation dispatch'\n+        bodyFile = 'issue-bodies/02-2-add-factorial-dispatch-body.md'\n+    }\n+)\n+\n+function Write-AtomicJson {\n+    param(\n+        [Parameter(Mandatory)][string]$Path,\n+        [Parameter(Mandatory)][AllowEmptyCollection()][object]$Value\n+    )\n+\n+    $temporaryPath = \"$Path.$([Guid]::NewGuid().ToString('N')).tmp\"\n+    try {\n+        $json = ConvertTo-Json -InputObject $Value -Depth 10\n+        [IO.File]::WriteAllText($temporaryPath, \"$json`n\", [Text.UTF8Encoding]::new($false))\n+        [IO.File]::Move($temporaryPath, $Path, $true)\n+    }\n+    finally {\n+        if (Test-Path -LiteralPath $temporaryPath) {\n+            Remove-Item -LiteralPath $temporaryPath\n+        }\n+    }\n+}\n+\n+function Read-CreationLedger {\n+    $parsed = [IO.File]::ReadAllText($ledgerPath) |\n+        ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Creation ledger JSON root must be an array.'\n+    }\n+\n+    $ledger = [object[]]$parsed\n+    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Creation ledger must not contain nested array entries.'\n+    }\n+    return $ledger\n+}\n+\n+function Write-CreationLedger {\n+    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)\n+    Write-AtomicJson -Path $ledgerPath -Value ([object[]]$Ledger)\n+}\n+\n+function Get-NormalizedChildren {\n+    $childrenOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" --paginate --slurp 2>&1\n+    $childrenExitCode = $LASTEXITCODE\n+    if ($childrenExitCode -ne 0) {\n+        throw \"Unable to query parent children: $($childrenOutput | Out-String)\"\n+    }\n+\n+    $normalizedOutput = ($childrenOutput | Out-String) |\n+        jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'\n+    $jqExitCode = $LASTEXITCODE\n+    if ($jqExitCode -ne 0) {\n+        throw \"Unable to normalize parent children response: $($normalizedOutput | Out-String)\"\n+    }\n+\n+    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate\n+    if ($null -eq $parsed) {\n+        return @()\n+    }\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Normalized parent children response must be an array.'\n+    }\n+    return [object[]]$parsed\n+}\n+\n+function Set-LedgerFlag {\n+    param(\n+        [Parameter(Mandatory)][long]$IssueId,\n+        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Flag,\n+        [Parameter(Mandatory)][bool]$Value\n+    )\n+\n+    $ledger = @(Read-CreationLedger)\n+    $entry = $ledger | Where-Object { [long]$_.id -eq $IssueId } | Select-Object -First 1\n+    if ($null -eq $entry) {\n+        throw \"Issue ID $IssueId was not found in the creation ledger.\"\n+    }\n+    $entry.$Flag = $Value\n+    Write-CreationLedger -Ledger ([object[]]$ledger)\n+}\n+\n+function Invoke-BodyVerifier {\n+    param(\n+        [Parameter(Mandatory)][int]$IssueNumber,\n+        [Parameter(Mandatory)][string]$BodyPath\n+    )\n+\n+    return & $bodyVerifier `\n+        -Repository $repo `\n+        -IssueNumber $IssueNumber `\n+        -ExpectedBodyPath $BodyPath `\n+        -MaxAttempts 6 `\n+        -DelaySeconds 5 `\n+        -DiagnosticPath (Join-Path $logDirectory \"issue-$IssueNumber-body-verification-failure.json\")\n+}\n+\n+function Reconcile-And-Fail {\n+    param([Parameter(Mandatory)][string]$OperationError)\n+\n+    try {\n+        $serverChildren = @(Get-NormalizedChildren)\n+        $linkedIds = [Collections.Generic.HashSet[long]]::new()\n+        foreach ($child in $serverChildren) {\n+            [void]$linkedIds.Add([long]$child.id)\n+        }\n+\n+        $ledger = @(Read-CreationLedger)\n+        foreach ($entry in $ledger) {\n+            $entry.linked = $linkedIds.Contains([long]$entry.id)\n+        }\n+        Write-CreationLedger -Ledger ([object[]]$ledger)\n+    }\n+    catch {\n+        $OperationError = \"$OperationError Reconciliation error: $($_.Exception.Message)\"\n+        $ledger = @(Read-CreationLedger)\n+    }\n+\n+    $result = [ordered]@{\n+        schemaVersion = 1\n+        status = 'failed'\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $OperationError\n+    }\n+    Write-AtomicJson -Path $resultPath -Value $result\n+\n+    Write-Error $OperationError\n+    if ($ledger.Count -eq 0) {\n+        Write-Output 'No issues were created; no cleanup is required.'\n+    }\n+    else {\n+        $ledger |\n+            Select-Object number, title, url, bodyFile, body_verified, linked |\n+            Format-Table -AutoSize |\n+            Out-String |\n+            Write-Output\n+        foreach ($entry in $ledger) {\n+            Write-Output \"gh issue delete $($entry.number) --repo `\"$repo`\" --yes\"\n+        }\n+        Write-Output 'The operation did not complete and no automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.'\n+    }\n+    exit 1\n+}\n+\n+Write-CreationLedger -Ledger ([object[]]@())\n+Write-AtomicJson -Path $resultPath -Value ([ordered]@{\n+    schemaVersion = 1\n+    status = 'in_progress'\n+    ledgerFile = 'creation-ledger.json'\n+    operationError = $null\n+})\n+\n+foreach ($draft in $drafts) {\n+    $bodyPath = Join-Path $logDirectory $draft.bodyFile\n+    try {\n+        $arguments = @(\n+            'api',\n+            \"repos/$repo/issues\",\n+            '-X', 'POST',\n+            '-f', \"title=$($draft.title)\",\n+            '-F', \"body=@$bodyPath\"\n+        )\n+        if (-not [string]::IsNullOrEmpty($selectedIssueType)) {\n+            $arguments += @('-f', \"type=$selectedIssueType\")\n+        }\n+        $arguments += @('--jq', '{id,number,node_id,html_url,title}')\n+\n+        $createOutput = & gh @arguments 2>&1\n+        $createExitCode = $LASTEXITCODE\n+        if ($createExitCode -ne 0) {\n+            throw \"Create failed for '$($draft.implementationSubsection)': $($createOutput | Out-String)\"\n+        }\n+        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json\n+\n+        $ledger = @(Read-CreationLedger)\n+        $ledger += [pscustomobject][ordered]@{\n+            implementationSubsection = $draft.implementationSubsection\n+            bodyFile = $draft.bodyFile\n+            id = [long]$createdIssue.id\n+            number = [int]$createdIssue.number\n+            title = [string]$createdIssue.title\n+            url = [string]$createdIssue.html_url\n+            body_verified = $false\n+            linked = $false\n+        }\n+        Write-CreationLedger -Ledger ([object[]]$ledger)\n+\n+        $null = Invoke-BodyVerifier -IssueNumber $createdIssue.number -BodyPath $bodyPath\n+        Set-LedgerFlag -IssueId $createdIssue.id -Flag body_verified -Value $true\n+\n+        $linkSucceeded = $false\n+        $lastLinkError = ''\n+        for ($attempt = 1; $attempt -le 3; $attempt++) {\n+            $payload = @{ sub_issue_id = [long]$createdIssue.id } | ConvertTo-Json -Compress\n+            $linkOutput = $payload | & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" -X POST --input - 2>&1\n+            $linkExitCode = $LASTEXITCODE\n+            if ($linkExitCode -eq 0) {\n+                $linkSucceeded = $true\n+                break\n+            }\n+            $lastLinkError = $linkOutput | Out-String\n+            if ($attempt -lt 3) {\n+                Start-Sleep -Seconds 2\n+            }\n+        }\n+        if (-not $linkSucceeded) {\n+            throw \"Link failed for issue #$($createdIssue.number) after 3 attempts: $lastLinkError\"\n+        }\n+        Set-LedgerFlag -IssueId $createdIssue.id -Flag linked -Value $true\n+    }\n+    catch {\n+        Reconcile-And-Fail -OperationError $_.Exception.Message\n+    }\n+}\n+\n+try {\n+    $ledger = @(Read-CreationLedger)\n+    if ($ledger.Count -ne $expectedTaskCount) {\n+        throw \"Expected $expectedTaskCount ledger entries; found $($ledger.Count).\"\n+    }\n+\n+    $serverChildren = @(Get-NormalizedChildren)\n+    if ($serverChildren.Count -ne ($baselineIds.Count + $ledger.Count)) {\n+        throw \"Parent child count did not increase by $($ledger.Count): baseline=$($baselineIds.Count), final=$($serverChildren.Count).\"\n+    }\n+\n+    $newChildren = @($serverChildren | Where-Object { $baselineIds -notcontains [long]$_.id })\n+    if ($newChildren.Count -ne $ledger.Count) {\n+        throw \"Expected $($ledger.Count) newly linked children; found $($newChildren.Count).\"\n+    }\n+    for ($index = 0; $index -lt $ledger.Count; $index++) {\n+        if ([long]$newChildren[$index].id -ne [long]$ledger[$index].id) {\n+            throw \"New child order differs from plan order at position $($index + 1).\"\n+        }\n+        if (-not [bool]$ledger[$index].linked) {\n+            throw \"Ledger entry for issue #$($ledger[$index].number) is not marked linked.\"\n+        }\n+\n+        $bodyPath = Join-Path $logDirectory $ledger[$index].bodyFile\n+        $issue = Invoke-BodyVerifier -IssueNumber $ledger[$index].number -BodyPath $bodyPath\n+        if ([string]$issue.state -cne 'open') {\n+            throw \"Issue #$($ledger[$index].number) is not open.\"\n+        }\n+        if (@($issue.assignees).Count -ne 0) {\n+            throw \"Issue #$($ledger[$index].number) unexpectedly has assignees.\"\n+        }\n+        if (-not [string]::IsNullOrEmpty($selectedIssueType) -and [string]$issue.type.name -cne $selectedIssueType) {\n+            throw \"Issue #$($ledger[$index].number) does not have type $selectedIssueType.\"\n+        }\n+    }\n+\n+    Write-AtomicJson -Path $resultPath -Value ([ordered]@{\n+        schemaVersion = 1\n+        status = 'complete'\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $null\n+    })\n+    Read-CreationLedger | ConvertTo-Json -Depth 10\n+}\n+catch {\n+    Reconcile-And-Fail -OperationError \"Postcondition verification failed: $($_.Exception.Message)\"\n+}\n*** End Patch\n"
```

</details>

```
Added 1 file(s): C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\run-stage20.ps1
```


---

<sub>1m 46s</sub>

### Copilot

Both persisted drafts passed the mandatory validator. I’m now performing the one-shot create → exact-body verify → link sequence in plan order, then checking final count, ordering, open/unassigned state, and body equality.

---

<sub>1m 54s</sub>

### `powershell`

**Create, link, and verify ordered child issues**

<details>
<summary>Arguments</summary>

```json
{
  "command": "& 'C:\\Users\\edburns\\workareas\\dd-3056167-01-windows-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260909-2008\\run-stage20.ps1'",
  "description": "Create, link, and verify ordered child issues",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>23 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
    "id": 5407268362,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3056167-01-windows/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
    "id": 5407268567,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3056167-01-windows/issues/3",
    "body_verified": true,
    "linked": true
  }
]
<shellId: 5 completed with exit code 0>
```

</details>


---

<sub>2m 1s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\stage-20-result.json.**

C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\stage-20-result.json

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}
```

</details>


---

<sub>2m 1s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\creation-ledger.json.**

C:\Users\edburns\workareas\dd-3056167-01-windows-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260909-2008\creation-ledger.json

<details>
<summary>22 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
    "id": 5407268362,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3056167-01-windows/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
    "id": 5407268567,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3056167-01-windows/issues/3",
    "body_verified": true,
    "linked": true
  }
]
```

</details>


---

<sub>2m 3s</sub>

### Copilot

**Stage 20 completed successfully.** Both issues are linked to #1, open, unassigned, ordered correctly, and verified against their persisted bodies.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1. Implement Fibonacci with unit and isolated CLI coverage | #2 | 1. Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3056167-01-windows/issues/2 |
| 2. Add factorial and operation dispatch | #3 | 2. Add factorial and operation dispatch | https://github.com/edburns/dd-3056167-01-windows/issues/3 |

**Given-list issue numbers:** `2,3`

**Suggested stage 25 invocation:** Invoke `shepherd-task-25-given-list` for `edburns/dd-3056167-01-windows`, base branch `experiment/shepherd-control`, plan directory `1-math-control-remove-before-merge`, campaign ID `61e0ba90-97d8-4ee8-b32c-90a2ce3ec2a4`, and ordered issues `2,3`.

Issues were created **without an issue type** because the repository belongs to a user account rather than an organization supporting the `Task` type.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
