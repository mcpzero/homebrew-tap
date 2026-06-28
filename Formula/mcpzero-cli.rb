# Homebrew formula for the MCPZERO CLI (prebuilt binaries).
#
# Distributed as compiled binaries — installing this does not require the CLI
# source. The mcpzero repo's `cli/scripts/release.sh` bumps `version` and the
# four `sha256` values on each CLI release; the URLs point at the mcpzero repo's
# GitHub Release assets (github.com/mcpzero/mcpzero/releases).
#
#   brew install mcpzero/tap/mcpzero-cli
#
class McpzeroCli < Formula
  desc "MCPZERO tunnel client — expose a local MCP server through the MCPZERO gateway"
  homepage "https://mcpzero.io"
  version "0.1.8"

  BASE = "https://github.com/mcpzero/mcpzero/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "4b33e494853b11302218aa75d09235c8a212994841e5ef5568925138f3241eed"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "3b2676a79ecfe5deac5d4f9aca8393a2d0b2b0ca2f80ed3d71cecc45f750959b"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_linux_arm64.tar.gz"
      sha256 "d50d5d28c88390087188d2427daab7149a068751601f9aa85998c46549fe1a8c"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_linux_amd64.tar.gz"
      sha256 "9976cb1850384175b4b884a06f57d2a5040d8451507d05b1d5593f1b89bc347c"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
