class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/memvault"
  url "https://github.com/dreamor/memvault/releases/download/v0.4.1/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "6286270b43c69c1f744a82f0ce8ca6841444965b6a383a27153419c66170ee51"
  version "0.4.1"
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
