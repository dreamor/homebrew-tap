class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/MemVault"
  url "https://github.com/dreamor/MemVault/releases/download/v0.4.5/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "013cbf09fa79a0d5dda2fb0dc6c832aca6b80826b16dfbea55663325b3495f73"
  version "0.4.5"
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
