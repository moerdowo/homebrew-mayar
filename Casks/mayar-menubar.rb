cask "mayar-menubar" do
  version "0.1.2"
  sha256 "b04c0eb2f783c4e707f3f6bcb155a1df6ccdd73ee1299b4951d024c3d86b1327"

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
