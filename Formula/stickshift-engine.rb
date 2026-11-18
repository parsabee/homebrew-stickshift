# frozen_string_literal: true

# Installs the Stick Shift Engine source from a release tag, for use as Cargo path dependencies:
#
#   brew install parsabee/stickshift/stickshift-engine
#
# A release is a tag, so each release points `url` and `sha256` at that tag's source archive.
class StickshiftEngine < Formula
  desc "Metal game engine for Apple Silicon, as Rust crates (source)"
  homepage "https://github.com/parsabee/StickShiftEngine"
  url "https://github.com/parsabee/StickShiftEngine/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1cc4b91b85d373d7e85f3bd51052b11b10456fd49b971acb46e751f475bc0b2c"
  license "Apache-2.0"

  # The engine renders with Metal on Apple Silicon. On an Intel Mac (or Linux) brew refuses to
  # install with "The arm64 architecture is required for this software." (or the macOS requirement).
  depends_on arch: :arm64
  depends_on :macos

  def install
    (pkgshare/"src").install Dir["*"], ".cargo"
  end

  def caveats
    <<~EOS
      The engine source is installed for use as Cargo path dependencies, e.g.:
        [dependencies]
        stickshift-core = { path = "#{opt_pkgshare}/src/crates/stickshift-core" }
        stickshift-scene = { path = "#{opt_pkgshare}/src/crates/stickshift-scene" }
      Take every engine crate from the same place. Building needs Rust 1.91 or newer
      (see #{opt_pkgshare}/src/rust-toolchain.toml).

      Or skip the install and depend on the release tag:
        stickshift-core = { git = "https://github.com/parsabee/StickShiftEngine", tag = "v#{version}" }

      Documentation:
        #{opt_pkgshare}/src/README.md
        #{opt_pkgshare}/src/docs/GETTING_STARTED.md
        https://parsabee.github.io/StickShiftEngine/
    EOS
  end

  test do
    src = pkgshare/"src"
    assert_match(/^version = "#{Regexp.escape(version.to_s)}"$/, (src/"Cargo.toml").read)
    %w[math ecs physics scene render-api render core].each do |crate|
      assert_path_exists src/"crates/stickshift-#{crate}/Cargo.toml"
    end
  end
end
