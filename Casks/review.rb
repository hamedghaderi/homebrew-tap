cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "746f2447b898965eb522a854b5d8c7694317d9a4097b548a6d262f1f5846995a",
         intel: "518192dfae0136e119e5d8019f3ef20d2a87f2b5429edafbc8f4e478bced309c"

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
