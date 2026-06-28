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
  version "0.1.7"

  BASE = "https://github.com/mcpzero/mcpzero/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "1d1da1a2bbe803a3ff20a082290858032b03c7a980b716d49ad0b3666cb9da28"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "ffde9b0200b93ccdfe3abd249079083b11d330ed80270ef46c8c2b09353c772f"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero-cli_#{version}_linux_arm64.tar.gz"
      sha256 "9fac38143df6d15ef6d2a21841b18f257ae4df94563a3e599108b62f9434d12c"
    end
    on_intel do
      url "#{BASE}/mcpzero-cli_#{version}_linux_amd64.tar.gz"
      sha256 "086260835b5fe0a4af9f9ba1b0da98fbdce71f288a7dde7065709a5443fb6396"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
