[CmdletBinding()]
param()

Set-StrictMode -Version Latest

BeforeAll {
    $script:MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
}

Describe 'math-tool.ps1 import behavior' {
    It 'does not write CLI output when dot-sourced' {
        $output = @(& { . $script:MathToolPath })

        $output | Should -HaveCount 0
    }
}

Describe 'Get-Fibonacci' {
    BeforeAll {
        . $script:MathToolPath
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

    It 'rejects negative input' {
        { Get-Fibonacci -N -1 } | Should -Throw
    }

    It 'returns a bigint value beyond Int64 range' {
        $output = @(& { Get-Fibonacci -N 100 })

        $output | Should -HaveCount 1
        $output[0] | Should -BeOfType [System.Numerics.BigInteger]
        $output[0] | Should -Be ([System.Numerics.BigInteger]::Parse('354224848179261915075'))
    }
}

Describe 'Get-Factorial' {
    BeforeAll {
        . $script:MathToolPath
    }

    It 'returns the numeric factorial value for N=<N>' -ForEach @(
        @{ N = 0; Expected = 1L }
        @{ N = 1; Expected = 1L }
        @{ N = 5; Expected = 120L }
    ) {
        $output = @(& { Get-Factorial -N $N })

        $output | Should -HaveCount 1
        $output[0] | Should -BeOfType [System.Numerics.BigInteger]
        $output[0] | Should -Be $Expected
    }

    It 'rejects negative input' {
        { Get-Factorial -N -1 } | Should -Throw
    }

    It 'returns a bigint value beyond Int64 range' {
        $output = @(& { Get-Factorial -N 25 })

        $output | Should -HaveCount 1
        $output[0] | Should -BeOfType [System.Numerics.BigInteger]
        $output[0] | Should -Be ([System.Numerics.BigInteger]::Parse('15511210043330985984000000'))
    }
}

Describe 'math-tool.ps1 CLI' {
    BeforeAll {
        $currentProcessPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
        if ((Split-Path -Leaf $currentProcessPath) -in @('pwsh', 'pwsh.exe')) {
            $script:PowerShellPath = $currentProcessPath
        }
        else {
            $script:PowerShellPath = (Get-Command pwsh -ErrorAction Stop).Source
        }
    }

    It 'writes exactly one formatted result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 7; Expected = 'Fibonacci(7) = 13' }
    ) {
        [string[]] $stdout = & $script:PowerShellPath -NoLogo -NoProfile -File $script:MathToolPath -N $N
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
    }

    It 'preserves positional binding for N' {
        [string[]] $stdout = & $script:PowerShellPath -NoLogo -NoProfile -File $script:MathToolPath 7
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly 'Fibonacci(7) = 13'
    }

    It 'writes exactly one formatted result line for -Operation <Operation> -N <N>' -ForEach @(
        @{ Operation = 'fibonacci'; N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ Operation = 'fibonacci'; N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ Operation = 'fibonacci'; N = 7; Expected = 'Fibonacci(7) = 13' }
        @{ Operation = 'factorial'; N = 0; Expected = 'Factorial(0) = 1' }
        @{ Operation = 'factorial'; N = 1; Expected = 'Factorial(1) = 1' }
        @{ Operation = 'factorial'; N = 5; Expected = 'Factorial(5) = 120' }
    ) {
        [string[]] $stdout = & $script:PowerShellPath -NoLogo -NoProfile -File $script:MathToolPath -Operation $Operation -N $N
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
    }

    It 'rejects an unsupported operation' {
        $stdout = & $script:PowerShellPath -NoLogo -NoProfile -File $script:MathToolPath -Operation 'sum' -N 3 2>$null
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Not -Be 0
        $stdout | Should -BeNullOrEmpty
    }
}
