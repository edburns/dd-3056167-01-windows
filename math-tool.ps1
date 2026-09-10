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

    [bigint] $previous = 0
    [bigint] $current = 1

    for ($i = 0; $i -lt $N; $i++) {
        [bigint] $next = $previous + $current
        $previous = $current
        $current = $next
    }

    $previous
}

# Dot-sourced unit tests import the function without exercising CLI output.
if ($MyInvocation.InvocationName -ne '.') {
    $value = Get-Fibonacci -N $N
    "Fibonacci($N) = $value"
}
