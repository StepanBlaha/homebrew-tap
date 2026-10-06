cask "refill" do
  version "0.3.1"
  sha256 "829d66725e28eb75746ecc972698de35b113c951a5ba897dbcf2964aa8b0893b"

  url "https://github.com/StepanBlaha/Refill/releases/download/v#{version}/Refill.zip"
  name "Refill"
  desc "Menu bar app that watches your AI subscription limits"
  homepage "https://stepanblaha.github.io/Refill/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Refill.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Refill.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.config/refill",
    "~/Library/Preferences/cz.stepanblaha.refill.plist",
    "~/Library/Group Containers/FW5CYB98R7.cz.stepanblaha.refill",
  ]

  caveats <<~EOS
    Refill is not notarized yet. The cask clears the quarantine flag.
    If the first open is still blocked, go to
    System Settings → Privacy & Security → Open Anyway. Or run:
      xattr -dr com.apple.quarantine /Applications/Refill.app
  EOS
end
