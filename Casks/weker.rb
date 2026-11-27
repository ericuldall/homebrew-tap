cask "weker" do
  version "0.1.1"
  sha256 "c96b2647be816cd5b511c8d6101563b8cf1a05c40e18eb3cb30480d3cf060321"

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
