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

  # The build is ad-hoc signed but not Apple-notarized, so macOS Gatekeeper
  # would otherwise show "Apple could not verify ... is free of malware" on
  # first launch. Strip the quarantine attribute Homebrew applied during
  # install — equivalent to the user right-clicking the app and choosing
  # Open, just done automatically.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MayarMenuBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/MayarMenuBar",
  ]

  caveats <<~CAVEATS
    First-launch quarantine is cleared automatically. If macOS still blocks
    the app, run:

      xattr -dr com.apple.quarantine /Applications/MayarMenuBar.app

    or open System Settings → Privacy & Security and click "Open Anyway".
  CAVEATS
end
