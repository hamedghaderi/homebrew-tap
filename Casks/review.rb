cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.16.0"
  sha256 arm:   "c78f10d27832b4fc26fccdce7281f3b3c19d479905ac1f3ffc6a7e9ad17841a1",
         intel: "b0a65d839a2bdc45edb632738d89598fb59beed1fa1a1d09ba3442146ef3d8c0"

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
