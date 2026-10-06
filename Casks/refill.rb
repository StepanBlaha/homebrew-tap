cask "refill" do
  version "0.3.2"
  sha256 "dade7bbb78169afdbbde1e8c69e5559441d61f3c512a07dddabfc4090211c03d"

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

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Refill.app"],
          must_succeed: false
    end
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
