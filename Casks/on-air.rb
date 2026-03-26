cask "on-air" do
  version "1.0.0"
  sha256 "d56540f0ace2e6be811e66d7f9f760a763d6960355327edaf9d48a7fd2012ce9"

  url "https://github.com/chaiovercode/on-air/releases/download/v#{version}/OnAir.zip"
  name "OnAir"
  desc "Menu bar app that keeps your meetings always visible"
  homepage "https://github.com/chaiovercode/on-air"

  depends_on macos: ">= :ventura"

  app "OnAir-Release/OnAir.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OnAir.app"],
                   sudo: false
  end

  caveats <<~EOS

    (( o ))  OnAir is installed.

    Open it from Applications or Spotlight.
    It lives in your menu bar — look for the broadcast icon.

    First launch will ask for calendar access.
    Shortcuts: J to join, T for timeline, Cmd+N for new event.

    github.com/chaiovercode/on-air

  EOS

  zap trash: [
    "~/Library/Application Support/OnAir",
    "~/Library/Preferences/com.onair.app.plist",
  ]
end
