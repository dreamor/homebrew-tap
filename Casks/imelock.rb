cask "imelock" do
  version "1.1.0"
  sha256 "1c0ac77fbaec68d47c4b1eab6ba1093522ad218ee97a466a50b647cce8a6c30d"

  url "https://github.com/dreamor/ImeLock/releases/download/v#{version}/ImeLock-#{version}.zip"
  name "ImeLock"
  desc "macOS input method locker - lock input method per app"
  homepage "https://github.com/dreamor/ImeLock"

  depends_on macos: ">= :sonoma"

  app "ImeLock.app"

  zap trash: [
    "~/Library/Caches/com.scottwang.ImeLock",
    "~/Library/Preferences/com.scottwang.ImeLock.plist",
  ]

  caveats <<~EOS
    ImeLock is not code-signed. On first launch:
      1. Right-click ImeLock.app and select "Open"
      2. Click "Open" in the Gatekeeper dialog

    After the first launch, it will open normally.
  EOS
end