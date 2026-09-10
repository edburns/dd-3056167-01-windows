## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

Apply these resolved decisions:

- The only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing `.github/workflows/shepherd-task-math-tool.yml` workflow installs exactly Pester 5.7.1 and invokes that repository-owned runner. Do not replace or bypass the runner or change the pinned Pester version.
- Direct CLI execution must write exactly one result line to stdout in the form `Fibonacci(N) = value`. Functions return numeric values with no incidental output. Inputs are non-negative integers.
- Production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- Research established no additional spike-derived implementation pattern for this task; implement from the plan and repository conventions rather than using research artifact code.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch.

This is task 1 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin work until this issue is assigned. Task 2 begins only after this task is merged.

## Implement

Create repository-root `math-tool.ps1` with:

- A script parameter named `N` accepting non-negative integer input.
- A pure `Get-Fibonacci` function that returns the numeric Fibonacci value without writing progress, labels, or other incidental output.
- Direct script execution that invokes the function and writes exactly `Fibonacci(N) = value` followed only by the normal line terminator.
- Correct behavior for `N=0`, `N=1`, and representative small non-negative values.

Create repository-root `math-tool.Tests.ps1` with:

- Dot-sourced unit tests that call `Get-Fibonacci` and assert numeric return values.
- Isolated child-`pwsh` process tests that execute `math-tool.ps1` as a CLI and assert its exact stdout contract.
- Coverage for `N=0`, `N=1`, and at least one representative small value greater than 1 in both the function and CLI surfaces.

Keep the implementation deterministic, objective, and small.

## Completion gates

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; it must exit zero.
- Confirm the pinned pull-request workflow passes without changing or bypassing its Pester 5.7.1 setup.
- Unit tests must distinguish the numeric function result from formatted CLI output and fail if the function emits incidental output.
- Child-process tests must fail on extra stdout lines, altered labels, spacing changes, or a result other than the exact `Fibonacci(N) = value` contract.
- The regression set must include exact expected results for `N=0`, `N=1`, and a representative small value greater than 1.
- Verify the pull request contains only the math tool and directly related tests unless a narrowly necessary repository-owned test-runner adjustment is explicitly justified.

## Out of scope

- Do not implement factorial or operation dispatch; those belong to task 2.
- Do not modify unrelated scripts, workflows, documentation, or dependencies.
- Do not replace the repository-owned test runner, loosen assertions, or alter the pinned Pester version.
- Do not copy or adapt spike source code or test helpers.
