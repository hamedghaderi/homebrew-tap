cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.12.0"
  sha256 arm:   "b8a5268ecd6f228fd5b2fdaccff3ec0a9888f25f7827d455aa9c04974a9936f7",
         intel: "9c8758ffe8c25792b456acf0c19f7434ce8cb86fd38fc6cb5d6d59e9bbc29f4a"

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
