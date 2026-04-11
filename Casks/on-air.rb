cask "on-air" do
  version "1.0.4"
  sha256 "c488483136532efc69a572e30974ea3ff6661d676476aa0471ed28c5ac3008c4"

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
    Shortcuts: J to join, T for timeline, F for focus, Cmd+N for new event.

    github.com/chaiovercode/on-air

  EOS

  zap trash: [
    "~/Library/Application Support/OnAir",
    "~/Library/Preferences/com.onair.app.plist",
  ]
end
