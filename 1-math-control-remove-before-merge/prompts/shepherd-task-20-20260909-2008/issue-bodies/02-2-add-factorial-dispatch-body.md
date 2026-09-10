## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

Apply these resolved decisions:

- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass the runner or change the pinned Pester version.
- Direct CLI execution must write exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation. Functions return numeric values with no incidental output. Inputs are non-negative integers.
- This task depends on task 1 having been merged. Preserve its Fibonacci function, CLI behavior, and tests while extending repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- Research established no additional spike-derived implementation pattern for this task; implement from the plan and repository conventions rather than using research artifact code.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch.

This is task 2 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin work until this issue is assigned, and only after task 1 has been merged into the base branch.

## Implement

Extend repository-root `math-tool.ps1` with:

- A pure `Get-Factorial` function that returns the numeric factorial value without writing progress, labels, or other incidental output.
- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.
- Direct execution that writes exactly one line: `Fibonacci(N) = value` for the Fibonacci operation or `Factorial(N) = value` for the factorial operation.
- Correct factorial behavior for `N=0`, `N=1`, and representative small non-negative values.
- Full preservation of task 1's Fibonacci behavior.

Extend repository-root `math-tool.Tests.ps1` with objective, small coverage for:

- Direct calls to `Get-Factorial`, asserting numeric return values and no incidental output.
- Isolated child-`pwsh` execution of factorial dispatch, asserting exact stdout.
- Regression coverage for the existing Fibonacci function and CLI operation.
- Factorial edge cases `N=0` and `N=1`, plus at least one representative small value greater than 1.

Follow the repository's established test style from the merged task 1 implementation. Implement production behavior and tests from scratch rather than using research artifact code.

## Completion gates

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; the combined regression suite must exit zero.
- Confirm the pinned pull-request workflow passes without changing or bypassing its Pester 5.7.1 setup.
- Unit tests must distinguish numeric function results from formatted CLI output and fail if either function emits incidental output.
- Child-process tests must assert both operation paths and fail on extra stdout lines, altered labels, spacing changes, or incorrect values.
- Factorial assertions must include `0! = 1`, `1! = 1`, and a representative small value greater than 1.
- Fibonacci regression assertions must retain edge and representative-value coverage from task 1.
- Dispatch tests must prove that selecting factorial does not invoke or label Fibonacci behavior, and selecting Fibonacci preserves the original contract.
- Verify both functions use the same non-negative-integer input contract and that the pull request remains limited to the math tool and its directly related tests.

## Out of scope

- Do not add operations other than `fibonacci` and `factorial`.
- Do not redesign the script into a module, add unrelated validation policy, or broaden the CLI beyond the resolved contract.
- Do not modify unrelated scripts, workflows, documentation, or dependencies.
- Do not replace the repository-owned test runner, loosen assertions, or alter the pinned Pester version.
- Do not copy or adapt spike source code or test helpers.
