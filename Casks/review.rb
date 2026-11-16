cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "f04f3cab5072abdb14cc3c20348eb7d4af656fffc9adb41ae3974faffd2f202a",
         intel: "79719793f7f7966f7ddc2b9455fc8d8ba19e9cb181775b2aa67f4f4648eb288d"

  url "https://github.com/hamedghaderi/review/releases/download/v#{version}/Review-mac-#{arch}.dmg"
  name "Review"
  desc "Local desktop code review for Git branches"
  homepage "https://github.com/hamedghaderi/review"

  depends_on macos: :ventura

  app "Review.app"

  zap trash: [
    "~/Library/Application Support/Review",
    "~/Library/Preferences/com.hamedghaderi.review.plist",
  ]

  caveats <<~EOS
    Review is not notarized by Apple yet, so macOS blocks the first open with
    "Apple could not verify Review is free of malware". To allow it, run:

      xattr -dr com.apple.quarantine #{appdir}/Review.app

    Or try to open it once, then go to System Settings > Privacy & Security
    and click "Open Anyway" next to "Review was blocked". Only the first open
    needs this.
  EOS
end
