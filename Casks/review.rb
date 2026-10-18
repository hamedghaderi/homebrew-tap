cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "8cc08fa9ef985a2a2fda2baaefb21a95422aadeb38f0b943a7b7dcba569532f0",
         intel: "b91e6471eb49d1a6b9b08739118b5d9815a11f5909e2e642ee50e62630bfd6d9"

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
