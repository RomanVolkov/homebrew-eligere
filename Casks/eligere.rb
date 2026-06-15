cask "eligere" do
  version "2.3.0_35,v2.3.0_35"
  sha256 "cc033ef1506e74567964b96cc36a7111a383eeef660c4c0f1a6de8bc58ccf33d"

  url "https://github.com/RomanVolkov/eligere_app/releases/download/#{version.csv.second}/Eligere_#{version.csv.first}_Installer_compressed.dmg"
  name "Eligere"
  desc "Helps you to use the right browser always"
  homepage "https://github.com/RomanVolkov/eligere_app"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Eligere.app"

  postflight do
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Eligere.app"]
  end
end
