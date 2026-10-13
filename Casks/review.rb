cask "review" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "e3b1845cf7a42783c8546e98805abe7c54e3444a197aee83721cecfdf69bf99b",
         intel: "16106e98a587a38409b96ff2dc473940986e2a9e4d276b36816c904faddc57eb"

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
end
