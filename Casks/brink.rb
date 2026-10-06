cask "brink" do
  version "0.11.2"
  sha256 "987877537cdf5241e9045d23302b5afbd690c461291153791a32f008ae550c86"

  url "https://github.com/StepanBlaha/Brink/releases/download/v#{version}/Brink-#{version}.zip"
  name "Brink"
  desc "Notch on the screen edge for your Notion pages and tasks"
  homepage "https://brinknotch.site/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
