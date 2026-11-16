# homebrew-stickshift

Homebrew tap for [Stick Shift Engine](https://github.com/parsabee/StickShiftEngine), a Rust game
engine for Apple platforms that renders with raw Metal.

```sh
brew install parsabee/stickshift/stickshift-engine
stickshift-demo
```

**Apple Silicon (arm64) Macs only.** Homebrew refuses to install on Intel Macs.

Installs:
- the prebuilt `stickshift-demo`, the engine's playable demo;
- the C library (`libstickshift`, its `stickshift.h` header, a Swift module map and a pkg-config
  file);
- the engine source under `$(brew --prefix)/share/stickshift-engine/src`, for use as Cargo path
  dependencies.

Run `brew info stickshift-engine` for details.

The canonical formula lives in the main repo at
[`packaging/homebrew/stickshift-engine.rb`](https://github.com/parsabee/StickShiftEngine/blob/main/packaging/homebrew/stickshift-engine.rb).
Each release's workflow points it, and this tap's copy, at the new release.
