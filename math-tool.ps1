[CmdletBinding()]
param(
    [ValidateRange(0, 10000)]
    [int] $N = 0
)

Set-StrictMode -Version Latest

<#
.SYNOPSIS
Returns the zero-indexed Fibonacci value for a non-negative integer.

.PARAMETER N
The Fibonacci index from 0 through 10000.

.OUTPUTS
System.Numerics.BigInteger
#>
function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [ValidateRange(0, 10000)]
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
$dotSourced = $MyInvocation.InvocationName -eq '.'
if (-not $dotSourced) {
    $value = Get-Fibonacci -N $N
    "Fibonacci($N) = $value"
}
