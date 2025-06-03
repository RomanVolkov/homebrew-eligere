cask "eligere" do
  version "1.4.1_25"
  sha256 "0063b9d6f5b21da0553741ff27d82b6dac24e27e9fcf0ac71d6167b5ba1d18ee"

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
