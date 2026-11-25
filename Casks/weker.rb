cask "weker" do
  version "0.1.0"
  sha256 "bab30b4e7c9dc188afde7111daa8e8fe7a596ae3e862e26269b77a0a3228941d"

  url "https://github.com/ericuldall/homebrew-tap/releases/download/weker-v#{version}/Weker-#{version}.zip"
  name "Weker"
  desc "Menu bar time tracker that works out which project you're on"
  homepage "https://www.weker.app/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Weker.app"

  # Test builds are signed with a development certificate but not notarized,
  # so macOS would refuse to open a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Weker.app"]
  end

  uninstall quit: "app.weker.mac"

  zap trash: "~/Library/Application Support/Weker"
end
