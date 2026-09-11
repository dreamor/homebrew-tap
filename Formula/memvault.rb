class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/memvault"
  url "https://github.com/dreamor/memvault/releases/download/v0.3.0/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "5b2bedeaa25b98a786b291d0aeb96180ed9e8fc28c458a76b2ff6228c670bd18"
  version "0.3.0"
  license "MIT"

  on_macos do
    # Intel Macs are not shipped as prebuilt binaries (no x86_64-apple-darwin
    # ONNX Runtime); Intel users install from source.
    only_arm64
  end

  def install
    bin.install "memvault-cli"
    bin.install "memvault-mcp"
    bin.install "memvault-proxy"
  end

  test do
    system "#{bin}/memvault-cli", "--version"
  end
end
