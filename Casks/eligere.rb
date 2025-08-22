cask "eligere" do
  version "1.4.0_24"
  sha256 "866ec98f483454d05070ac99c0d966d5b043e92190c5bc9f588377596a5a2a5f"

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
