cask "brink" do
  version "0.12.0"
  sha256 "e23b26fa2d38286f9817429103ed400b7d65de047741733598bc10a33aa3c448"

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
