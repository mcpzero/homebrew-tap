# mcpzero/homebrew-tap

Homebrew tap for the [MCPZERO](https://mcpzero.io) CLI.

```bash
brew install mcpzero/tap/mcpzero-cli
```

(equivalent to `brew tap mcpzero/tap && brew install mcpzero-cli`.)

## How releases work

The formula in `Formula/mcpzero-cli.rb` installs **prebuilt binaries** from the mcpzero
repo's [GitHub Release assets](https://github.com/mcpzero/mcpzero/releases) — no
source needed. On each CLI release, the CLI repo's release script regenerates
this formula with the new `version` and the per-platform `sha256` values, and
commits it here.

> This repo must be named `homebrew-tap` for `brew install mcpzero/tap/...` to
> resolve.
