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
  version "0.1.3"

  BASE = "https://github.com/mcpzero/cli/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_darwin_arm64.tar.gz"
      sha256 "ed83137caa7b50d2acb81a3338a9e96b219b74c6e5a1f3897130575833de8aa0"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_darwin_amd64.tar.gz"
      sha256 "38e1d4111bddf90492e3fb47c80e06ffba5aa30ab2a0ff0d5631b35685b401c1"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_linux_arm64.tar.gz"
      sha256 "ae642738aabc4c8666960cb5a5947f7d5c940301ad37ef6dd997818d22c588dc"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_linux_amd64.tar.gz"
      sha256 "88701316d906a06086bfd047ef195a13d04d115d52bae57bd4e97388648c9f78"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
