[CmdletBinding()]
param()

Set-StrictMode -Version Latest

Describe 'Get-Fibonacci' {
    BeforeAll {
        $MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        . $MathToolPath
    }

    It 'does not write CLI output when dot-sourced' {
        $output = @(& { . $MathToolPath })

        $output | Should -HaveCount 0
    }

    It 'returns the numeric Fibonacci value for N=<N>' -ForEach @(
        @{ N = 0; Expected = 0L }
        @{ N = 1; Expected = 1L }
        @{ N = 7; Expected = 13L }
    ) {
        $output = @(& { Get-Fibonacci -N $N })

        $output | Should -HaveCount 1
        $output[0] | Should -BeOfType [System.Numerics.BigInteger]
        $output[0] | Should -Be $Expected
    }
}

Describe 'math-tool.ps1 CLI' {
    BeforeAll {
        $MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $PowerShellPath = (Get-Process -Id $PID).Path
    }

    It 'writes exactly one formatted result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 7; Expected = 'Fibonacci(7) = 13' }
    ) {
        [string[]] $stdout = & $PowerShellPath -NoLogo -NoProfile -File $MathToolPath -N $N
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
    }
}
