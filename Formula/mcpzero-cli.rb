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
  version "0.1.1"

  BASE = "https://github.com/mcpzero/mcpzero/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "5dc15b520f783862b4d72ed6ca20682abbc88a8260ad6ce61fffc2fb3ddf07b0"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "7856abdccc56d8fd71b27eac0bc6e8b2f68835291ad6ec339afec8d3a26b49da"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_linux_arm64.tar.gz"
      sha256 "ebf5c6c02a4165b5c8706f05ccfc78668c49c56d78c3a6a4103dd8fc24f9f3e7"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_linux_amd64.tar.gz"
      sha256 "e9d7ab01863224e928ade8a963f2566e4373757b3b0863878d6f2f27018e32f3"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
