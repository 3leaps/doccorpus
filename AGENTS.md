# doccorpus — AI Agent Guide

## Safety header (read first)

**This repository is public, and every committed byte is admitted as
`0-public`.** Before adding or changing anything, treat that as a hard gate.

- Never derive a fixture from a real file, even if you rename or redact it.
  Recreate the behavior as a minimal synthetic case.
- Never name a non-public repository, branch, commit, product, person, or
  internal process anywhere: fixtures, manifests, comments, generator source,
  commit messages, or PR text.
- Never add an `unknown/`, `pending/`, or intake directory.
- Public consumers may be named once they are public. Private consumers are
  never named here.

This is a **security-sensitive** repository: document parsers handle untrusted
input, and some fixtures will be deliberately hostile (zip bombs, deep nesting,
huge sheets). Do not run hostile cases through a parser outside a bounded
runner.

## Before changing behavior

- `README.md`
- `fixtures/README.md` when touching inputs
- `docs/` decision and admission records when they exist

If local guidance exists for this repository, read it as well.

## Development

```sh
make check        # structure, format check, lint
make fmt          # apply formatting (fixtures/ and expected/ are never touched)
make structure    # prove required root files and placeholder dirs exist
```

- Maintainer tooling is goneat with ruff, yamllint, yamlfmt, shfmt, actionlint,
  and checkmake. CI runs it in a digest-pinned runner image.
- Never open fixture files in an editor or formatter that rewrites bytes.
- After editing a fixture, recompute its content hash and size in the case
  manifest. Never edit a fixture to match an expectation.
- New cases start `provisional`. Only a reviewer distinct from the author
  marks one `reviewed`.
- Future tooling is Python 3.9+ standard library only. Do not add a package
  manager, requirements file, or third-party import.
- Metadata is JSON or JSONL and must contain no duplicate keys.
- Hydration and run output go to a directory outside this checkout.

## Rules of the road

- Work on a feature branch and open a PR to protected `main`.
- Public commit and PR text describes the change only. Keep planning codes
  and rationale out of it.
- Attribution: every commit message and PR body ends with:

  ```text
  Role: <bare role slug>
  Co-authored-by: <model> <noreply@3leaps.net>
  Committer-of-Record: @3leapsdave
  ```
