# Homebrew formula template — packaging/release.sh fills 0.1.1 / bb85e2bddd94ca1fa7e99f1821f3f5dfd890bd0ba09f4385e4b950375ac85a45 and writes
# Formula/pier.rb into the StepanBlaha/homebrew-tap repo.
class Pier < Formula
  desc "See what's running on localhost and which project it belongs to"
  homepage "https://github.com/StepanBlaha/pier"
  url "https://github.com/StepanBlaha/pier/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bb85e2bddd94ca1fa7e99f1821f3f5dfd890bd0ba09f4385e4b950375ac85a45"
  license "MIT"
  head "https://github.com/StepanBlaha/pier.git", branch: "main"

  depends_on macos: :sonoma

  def install
    # Built from source with the local Swift toolchain (Xcode or Command Line Tools),
    # so nothing is quarantined and Gatekeeper never prompts.
    args = ["--disable-sandbox", "-c", "release"]
    system "swift", "build", *args, "--product", "pier"
    system "swift", "build", *args, "--product", "PierApp"
    bin_path = Utils.safe_popen_read("swift", "build", *args, "--show-bin-path").chomp

    libexec.install "#{bin_path}/pier", "#{bin_path}/PierApp"
    libexec.install Dir["#{bin_path}/*.bundle"]
    libexec.install "packaging/AppIcon.icns" if File.exist?("packaging/AppIcon.icns")
    bin.install_symlink libexec/"pier"

    generate_completions_from_executable(bin/"pier", "--generate-completion-script")
  end

  def caveats
    <<~EOS
      Install the menu bar app (copies Pier.app to ~/Applications):
        pier app install

      Let Claude Code see your services:
        claude mcp add pier -- #{opt_bin}/pier mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pier --version")
    port = shell_output("#{bin}/pier free 41000").strip.to_i
    assert_operator port, :>=, 41000
  end
end
