cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "56494e4356b190eb4568d95b4542b31d0a2c89ba2b0c3cf78ff6881e65704905",
         intel: "f0646c8061f01d3ea5c052e11618f2c7d5280c803c423a599911894c38061b94"

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
