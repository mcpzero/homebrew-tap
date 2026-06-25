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
  version "0.1.6"

  BASE = "https://github.com/mcpzero/cli/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_darwin_arm64.tar.gz"
      sha256 "15ca546cf50df5723354a13bbf5786ef6642d5751a2e836ed26b37b44dadcc16"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_darwin_amd64.tar.gz"
      sha256 "10d8c7d9f9dc29165a75e7a4e9388a0a4661076bfc68876cf9700bc811c2a44a"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_linux_arm64.tar.gz"
      sha256 "48f452ea459d19d87efaf83f966998bd53eba7c255e13e3e2e5014c472421317"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_linux_amd64.tar.gz"
      sha256 "b3db2014b31360ffd0d8351907168b36b06ee20a52e602809fa4f5839ce5d88a"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
