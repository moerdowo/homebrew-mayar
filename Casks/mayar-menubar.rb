cask "mayar-menubar" do
  version "0.1.1"
  sha256 "c4610fd7f44c853e6ea3ab38ffe26562d20f725dffd53f43903bee746eda9e29"

  url "https://github.com/moerdowo/mayar-mac-menubar/releases/download/v#{version}/MayarMenuBar-#{version}.dmg"
  name "Mayar Menu Bar"
  desc "Menu bar app to check Mayar balance and transactions"
  homepage "https://github.com/moerdowo/mayar-mac-menubar"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MayarMenuBar.app"

  zap trash: [
    "~/Library/Application Support/MayarMenuBar",
  ]
end
