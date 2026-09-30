cask "brink" do
  version "0.10.0"
  sha256 "3ac72b59fde459118d6e4fcc097cfa57f4af33fe7d1387c525db03b3b4e355bb"

  url "https://github.com/StepanBlaha/Brink/releases/download/v#{version}/Brink-#{version}.zip"
  name "Brink"
  desc "Notch on the screen edge for your Notion pages and tasks"
  homepage "https://brinknotch.site/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Brink.app"

  zap trash: [
    "~/Library/Application Support/NotionDock",
    "~/Library/Caches/cz.stepanblaha.notiondock",
    "~/Library/Group Containers/FW5CYB98R7.cz.stepanblaha.brink",
    "~/Library/Preferences/cz.stepanblaha.notiondock.plist",
  ]

  caveats <<~EOS
    Brink is not notarized yet. The first time, right-click Brink in
    Applications and choose Open, then Open again.
  EOS
end
