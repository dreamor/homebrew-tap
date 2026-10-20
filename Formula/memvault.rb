class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/MemVault"
  url "https://github.com/dreamor/MemVault/releases/download/v0.6.0/memvault-aarch64-apple-darwin.tar.gz"
  sha256 "4161f7b65f1579aec0735eba8e57b6cbb35548f322c50d123496f97c6d44e64e"
  version "0.6.0"
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

  #  (or )
  # runs the REST backend that hosts the embedded Web Dashboard, and starts
  # it again at login (LaunchAgent on macOS / systemd user unit on Linux).
  # --auto-port keeps behavior sane if another MemVault instance is already
  # serving the preferred port: it adopts that instance instead of failing.
  service do
    # The Web Dashboard is embedded in the binary — no --serve-web needed.
    run [opt_bin/"memvault-mcp", "--transport", "http", "--port", "3777", "--auto-port"]
    keep_alive false
    log_path var/"log/memvault.log"
    error_log_path var/"log/memvault-error.log"
  end

  test do
    system "#{bin}/memvault-cli", "--version"
  end
end
