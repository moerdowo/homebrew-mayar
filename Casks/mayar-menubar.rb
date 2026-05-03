cask "mayar-menubar" do
  version "0.1.0"
  sha256 "c5c5aa74c5ad6dd2b442f5f1bdecba492b0fe04c430cd19e4ce1db50a3d360a1"

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

  caveats <<~CAVEATS
    The app is ad-hoc signed and not notarized. If macOS Gatekeeper blocks it,
    either right-click the app and choose Open, or run:

      xattr -dr com.apple.quarantine /Applications/MayarMenuBar.app
  CAVEATS
end
