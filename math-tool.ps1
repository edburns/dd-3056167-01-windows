[CmdletBinding()]
param(
    [ValidateScript({ $_ -ge 0 }, ErrorMessage = 'N must be a non-negative integer.')]
    [int] $N = 0
)

Set-StrictMode -Version Latest

<#
.SYNOPSIS
Returns the zero-indexed Fibonacci value for a non-negative integer.

.PARAMETER N
The non-negative Fibonacci index.

.OUTPUTS
System.Numerics.BigInteger
#>
function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [ValidateScript({ $_ -ge 0 }, ErrorMessage = 'N must be a non-negative integer.')]
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

# PowerShell sets InvocationName to '.' when dot-sourcing; other invocations exercise CLI output.
$dotSourced = $MyInvocation.InvocationName -eq '.'
if (-not $dotSourced) {
    $value = Get-Fibonacci -N $N
    "Fibonacci($N) = $value"
}
