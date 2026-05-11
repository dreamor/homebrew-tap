cask "imelock" do
  version "1.0.0"
  sha256 "f4499ed713504a8ba10d33d47fd1af83fc10fc30f0e3ed1d30ac5c5b1bb3eb2e"

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