# Homebrew formula for the MCPZERO CLI (prebuilt binaries).
#
# Distributed as compiled binaries — installing this does not require the CLI
# source. The CLI repo's `scripts/release.sh` bumps `version` and the four
# `sha256` values on each CLI release; the URLs point at the cli repo's GitHub
# Release assets (github.com/mcpzero/cli/releases).
#
#   brew install mcpzero/tap/mcpzero
#
class Mcpzero < Formula
  desc "MCPZERO tunnel client — expose a local MCP server through the MCPZERO gateway"
  homepage "https://mcpzero.io"
  version "0.1.0"

  BASE = "https://github.com/mcpzero/cli/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_darwin_arm64.tar.gz"
      sha256 "cf7757980a336949346dc560b0320e654a0f1185da9eaa77dc3839e665466fbc"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_darwin_amd64.tar.gz"
      sha256 "794c754a69705e6d833ef425f2efa4263ae2c33d08a07f9e4fa7158b2f9cd6da"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_linux_arm64.tar.gz"
      sha256 "64f6f0772c56aa63ddfa23ccb0c3408987bf11b2c354239ffce668c9d5481eb0"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_linux_amd64.tar.gz"
      sha256 "3a4be670d5f88495d6a0f4b45307b47af98a6c2ff8cf1abc60cf4b5917ed86e5"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
