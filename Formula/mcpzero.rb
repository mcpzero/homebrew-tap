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
  version "0.1.4"

  BASE = "https://github.com/mcpzero/cli/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_darwin_arm64.tar.gz"
      sha256 "042883d72ce953e7b06751e9875841ff41fd42aabe84a0e8e169ab9471320eb7"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_darwin_amd64.tar.gz"
      sha256 "cf109b4768d44ab30eac1f3f61db5244b3638a27afd5fe1c428d4897ee12944a"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/mcpzero_#{version}_linux_arm64.tar.gz"
      sha256 "ece94fea3808098e40553507d5b72fd9a296f46dc88fba445078616cf25c75bb"
    end
    on_intel do
      url "#{BASE}/mcpzero_#{version}_linux_amd64.tar.gz"
      sha256 "9d5c78e3798851b38749290635aa83a0364a915eb6ca69f1f285ce4e12b5edd7"
    end
  end

  def install
    bin.install "mcpzero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpzero --version")
  end
end
