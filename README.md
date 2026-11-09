# doccorpus

Public, fully synthetic document fixtures and expected extracts for document
readers and their language bindings. DOCX, XLSX, PPTX, Markdown, HTML, and XML
come first; PDF is reserved until a consumer needs it.

doccorpus holds the inputs, the expected properties, and the provenance
records. It does not contain a parser. Each consumer writes a small driver that
runs its own API against a pinned corpus release. The first consumer is the
public [docprims](https://github.com/3leaps/docprims) extraction toolkit.

## Principles

- **Public only.** Every case is synthetic, or comes from a public source with
  documented redistribution rights. Nothing is derived from private data, and
  redacted or blinded material is never admitted.
- **Byte-exact fixtures.** Git never rewrites line endings or filters under
  `fixtures/` or `expected/`. Binary Office packages and text extracts must
  round-trip byte-for-byte.
- **Format truth is kept apart from adapter policy.** Format-level extraction
  results can be checked against any engine. Budgets, resource accounting, and
  profile-specific policy appear only under a named, versioned profile.
- **Nothing to install beyond `python3`.** Future tooling uses only the Python
  3.9+ standard library; there is no package manager and no virtual
  environment.
- **Bounded execution.** Hostile cases run only under enforced limits.

## Layout

| Path | Role |
|------|------|
| `fixtures/` | Committed document inputs (see `fixtures/README.md`) |
| `expected/` | Byte-exact expected extracts and property records |
| `manifests/` | Case records, profiles, and provenance (empty until first cases) |

## Usage

Maintainers run `make check` for everything non-mutating: formatting, lint, and
a structure gate that proves the required root files and placeholder layout
exist. Format and lint use [goneat](https://github.com/fulmenhq/goneat).

```sh
make check        # structure + format check + lint
make fmt          # apply formatting (fixtures/ and expected/ are never touched)
make structure    # prove required files and dirs exist
```

Corpus validate / hydrate / list targets will arrive with the first case
ladder. Until then this repository is a licensed, CI-gated scaffold.

## Status

Pre-release scaffold. No cases have shipped yet. Decision records and admission
rules will land with the first fixture PR.

## Consuming

Pin a commit or release, together with its content hashes and the profile
revision. Never track `main`.

## License

Licensed under either of [Apache License, Version 2.0](LICENSE-APACHE) or
[MIT license](LICENSE-MIT) at your option. Material imported from public
upstreams keeps its own license and notices, recorded per case. See [NOTICE](NOTICE) for copyright and project name terms.
