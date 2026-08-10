cask "bobber" do
  version "0.1.1"
  sha256 "5855360a9b6ad3193b56763740b14b65156183205c5286ada58be423b4bcae25"

  # 소스 레포(chattymin/Bobber)는 private이라 그쪽 릴리스 asset은 익명 접근에 404다.
  # 배포용 zip은 이 tap 레포의 `bobber-vX.Y.Z` 릴리스에 올린다.
  # Bobber가 public이 되면 url을 소스 레포로 되돌려라.
  url "https://github.com/chattymin/homebrew-tap/releases/download/bobber-v#{version}/Bobber.zip"
  name "Bobber"
  desc "Cat that fishes on the MacBook notch, driven by the real weather"
  homepage "https://github.com/chattymin/homebrew-tap"

  # macOS 14(Sonoma) 이상. `depends_on macos:`의 기본 비교자가 `>=`다
  depends_on macos: :sonoma

  app "Bobber.app"

  # 애드혹 서명이라 Gatekeeper가 quarantine을 붙인 채로는 열지 못한다.
  # 공증(notarization)은 유료 Apple Developer 계정이 필요해 하지 않는다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Bobber.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Bobber",
    "~/Library/Preferences/app.bobber.Bobber.plist",
    "~/Library/Saved Application State/app.bobber.Bobber.savedState",
  ]
end
