cask "eligere" do
  version "1.4.2_26"
  sha256 "7b204b528a520c6d5e75fd6f2546992df878c4b70d7f60dd11c857ac64626448"

  url "https://update.eligere.dev/Eligere_#{version}_Installer_compressed.dmg"
  name "Eligere"
  desc "Helps you to use the right browser always"
  homepage "https://eligere.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Eligere.app"
end
