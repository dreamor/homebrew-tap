# dreamor/homebrew-tap

Homebrew tap for [ImeLock](https://github.com/dreamor/ImeLock) and [MemVault](https://github.com/dreamor/memvault).

## Usage

```bash
brew tap dreamor/tap

brew install --cask imelock   # ImeLock (GUI app)
brew install memvault         # MemVault (CLI + MCP server)
```

MemVault formula is Apple Silicon macOS only — Intel macOS has no prebuilt
binaries (see [docs/DISTRIBUTION.md](https://github.com/dreamor/memvault/blob/master/docs/DISTRIBUTION.md));
Linux/Windows users use `scripts/install.sh` / `scripts/install.ps1`.
