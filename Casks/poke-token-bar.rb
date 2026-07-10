cask "poke-token-bar" do
  version "2.3.4"
  sha256 :no_check

  url "https://github.com/chattymin/PokeTokenBar/releases/download/v#{version}/PokeTokenBar.zip"
  name "PokeTokenBar"
  desc "Menu bar app turning AI coding token usage into a growing Pokemon"
  homepage "https://github.com/chattymin/PokeTokenBar"

  app "PokeTokenBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/PokeTokenBar.app"],
                   sudo: false
  end


  zap trash: [
    "~/Library/Application Support/PokeTokenBar",
    "~/Library/Preferences/io.github.chattymin.poketokenbar.plist",
    "~/Library/Logs/PokeTokenBar.log",
  ]
end
