cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "d45502ef0b7b4dcdf38541afd98974b04be751578de989b7e346b94c277541dd",
         intel: "bf3e7414bc936e40084a3de40a4554939a8851a58a898386ff1ab09e70231f5e"

  url "https://github.com/hamedghaderi/review/releases/download/v#{version}/Review-mac-#{arch}.dmg"
  name "Review"
  desc "Local desktop code review for Git branches"
  homepage "https://github.com/hamedghaderi/review"

  depends_on macos: ">= :ventura"

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
