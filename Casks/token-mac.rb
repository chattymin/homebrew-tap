cask "token-mac" do
  version "1.0.0"
  sha256 :no_check

  url "https://github.com/chattymin/token-mac/releases/download/v#{version}/TokenMac.zip"
  name "TokenMac"
  desc "Menu bar app showing today's AI coding token usage"
  homepage "https://github.com/chattymin/token-mac"

  app "TokenMac.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/TokenMac.app"],
                   sudo: false
  end

  caveats <<~EOS
    TokenMac requires the `ccusage` CLI on your PATH:
      npm install -g ccusage
    Optionally install `ccusage-codex` to also track Codex usage.
  EOS

  zap trash: [
    "~/Library/Application Support/TokenMac",
    "~/Library/Preferences/io.github.chattymin.tokenmac.plist",
    "~/Library/Logs/TokenMac.log",
  ]
end
