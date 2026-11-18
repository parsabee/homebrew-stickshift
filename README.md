# homebrew-stickshift

Homebrew tap for [Stick Shift Engine](https://github.com/parsabee/StickShiftEngine), a Rust game
engine for Apple platforms that renders with raw Metal.

```sh
brew install parsabee/stickshift/stickshift-engine
```

**Apple Silicon (arm64) Macs only.** Homebrew refuses to install on Intel Macs.

Installs the engine source under `$(brew --prefix)/share/stickshift-engine/src`, for use as Cargo
path dependencies. Run `brew info stickshift-engine` for an example.

A game can also skip the install and depend on a release tag directly; see
[Using the engine in a game](https://github.com/parsabee/StickShiftEngine#using-the-engine-in-a-game).

Each release points the formula's `url` and `sha256` at its tag's source archive.
