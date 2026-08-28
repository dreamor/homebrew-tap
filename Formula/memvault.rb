class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/memvault"
  url "https://github.com/dreamor/memvault/releases/download/v0.2.0/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "ad749e5fab96a6288fc88cc582567345056c2713531feda7171582a43bdff352"
  version "0.2.0"
  license "MIT"

  on_macos do
    # Intel macOS has no prebuilt binaries (fastembed / ONNX Runtime ships no
    # x86_64-apple-darwin artifacts); Intel users install from source.
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
