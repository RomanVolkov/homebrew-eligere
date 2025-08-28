cask "eligere" do
  version "2.0.1_32,v2.0.1"
  sha256 "4f95d3bf9fef7fd8063109729f3260e224f8fab11eaffff46e9ad45248320187"

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
