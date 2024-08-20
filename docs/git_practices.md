# git Practices

## Semantic Versioning

[Semantic Versioning](https://semver.org/lang/ja/)

## Naming Git Branches

### Use Separators

When writing a branch name, using separators such as hyphen (-) or slash (/) helps
to increase readability of the name. But remember to be consistent with the chosen
separator for all branches names.

Example:

```console
feature/camera-data-collection
trivial/fix-typos
```

### Start Name with Category Word

It is recommended to begin the name of a branch with a **category word**, which indicates
the type of task that is being solved with that branch. Some of the most used
**category words** are:

| Category Word | Meaning                                                                  |
| ------------- | ------------------------------------------------------------------------ |
| hotfix        | for quickly fixing critical issues, usually with a temporary solution    |
| bugfix        | for fixing a bug                                                         |
| feature       | for adding, removing or modifying a feature                              |
| trivial       | for adding, removing or modifying a stuff (**NOT** linked issue tickets) |
| test          | for experimenting something which is not an issue                        |

### Avoid Long Branch Names

As much as the branch name needs to be informative, it also needs to be precise
and short. Detailed and long names can affect readability and efficiency.

## Git Commit Messages

Follow [the commit conventions](https://www.conventionalcommits.org/en/).
We recommend setting [`.gitmessage`](https://github.com/nino-kin/craft/blob/main/.gitmessage)
as the commit template.

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line
- When only changing documentation, include `[ci skip]` in the commit title
  (see [here](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs))
