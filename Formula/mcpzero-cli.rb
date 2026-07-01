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
  version "0.1.9"

  BASE = "https://github.com/mcpzero/mcpzero/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "961551986629dadaeb1f3e5cd8b98257526456b4fdaadaa5379b85b5bd154318"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "f386a728b0e639f49ce16fd1b6da8539c945ab6f8c4dcf2bb271cc885bf0131d"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_linux_arm64.tar.gz"
      sha256 "f40643960c7549ea2cf618140ed9ae1b7d3956e79c5d4d59fb5da142211ba0b3"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_linux_amd64.tar.gz"
      sha256 "7c7b1ac60ed6d87ef49c8ccd2ed80c33f75208e9279466045c8de62713b48923"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
