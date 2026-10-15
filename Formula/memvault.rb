class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/MemVault"
  url "https://github.com/dreamor/MemVault/releases/download/v0.4.3/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "693e7b115ffd623a489a7dc63b23036532ecd5886a64a523055955619ece04a7"
  version "0.4.3"
  license "MIT"

  # Intel Macs are not shipped as prebuilt binaries (no x86_64-apple-darwin
  # ONNX Runtime); Intel users install from source.
  #
  # Note:  is NOT valid Homebrew DSL and hard-fails formula
  # parsing (observed live: undefined local variable). 
  # is the supported way to express an Apple Silicon-only formula.
  depends_on arch: :arm64

  def install
    bin.install "memvault-cli"
    bin.install "memvault-mcp"
    bin.install "memvault-proxy"
  end

  test do
    system "#{bin}/memvault-cli", "--version"
  end
end
