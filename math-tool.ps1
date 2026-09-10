[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int] $N = 0
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int] $N
    )

    [long] $previous = 0
    [long] $current = 1

    for ($i = 0; $i -lt $N; $i++) {
        [long] $next = $previous + $current
        $previous = $current
        $current = $next
    }

    $previous
}

if ($MyInvocation.InvocationName -ne '.') {
    $value = Get-Fibonacci -N $N
    "Fibonacci($N) = $value"
}
