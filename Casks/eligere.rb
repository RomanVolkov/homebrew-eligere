cask "eligere" do
  version "2.1.0_33,v2.1.0_33"
  sha256 "56c97fedbb5e7f4b8cdc612ad57d95841ed94d4962f748aa593a6d5388df9a40"

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
