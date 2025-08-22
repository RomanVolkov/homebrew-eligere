cask "eligere" do
  version "2.0.0_31,v2.0.0"
  sha256 "016d61a8d4bffb045a1cbf8d96fd25f0102e05cc81feafedc95e43256fb13d51"

  url "https://github.com/RomanVolkov/eligere_app/releases/download/#{version.csv.second}/Eligere_#{version.csv.first}_Installer_compressed.dmg"
  name "Eligere"
  desc "Helps you to use the right browser always"
  homepage "https://github.com/RomanVolkov/eligere_app"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Eligere.app"
end
