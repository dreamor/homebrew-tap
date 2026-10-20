class Memvault < Formula
  desc "Shared memory layer for every AI agent you run (CLI + MCP server)"
  homepage "https://github.com/dreamor/MemVault"
  # Shipped as the @dreamor/memvault-bin npm tarball and pulled from the npm
  # China mirror, which serves it at multi-MB/s where the same archive from
  # github.com crawls. npmjs.org serves byte-identical bytes, so it is a
  # checksum-compatible fallback.
  url "https://registry.npmmirror.com/@dreamor/memvault-bin/-/memvault-bin-0.6.0.tgz"
  mirror "https://registry.npmjs.org/@dreamor/memvault-bin/-/memvault-bin-0.6.0.tgz"
  sha256 "6d24ef7430585052bb2814ebaacd8b3d485285d6a5e66c4340c8d57d9f4d23e8"
  version "0.6.0"
  license "MIT"

  # Intel Macs are not shipped as prebuilt binaries (no x86_64-apple-darwin
  # ONNX Runtime); Intel users install from source.
  #
  # Note: `only_arm64` is NOT valid Homebrew DSL and hard-fails formula
  # parsing (observed live: undefined local variable). `depends_on arch:`
  # is the supported way to express an Apple Silicon-only formula.
  depends_on arch: :arm64

  # The archive is an npm package, so every file sits under `package/`.
  # Homebrew's tarball strategy enters that lone top-level directory itself.
  def install
    bin.install "memvault-cli"
    bin.install "memvault-mcp"
    bin.install "memvault-proxy"
  end

  # `brew services start memvault` (or `brew services restart memvault`)
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
