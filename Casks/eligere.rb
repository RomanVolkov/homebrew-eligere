cask "eligere" do
  version "1.4.6_30"
  sha256 "c2c71fe89325dc36f0148acb28905bd0ef6ea49270eaeb3873ac107b4bf31d16"

  url "https://update.eligere.dev/Eligere_#{version}_Installer_compressed.dmg"
  name "Eligere"
  desc "Helps you to use the right browser always"
  homepage "https://github.com/RomanVolkov/eligere_app"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Eligere.app"
end
