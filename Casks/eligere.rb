cask "eligere" do
  version "1.4.5_29"
  sha256 "b498241977c7bc45471c417dc93652967f72b76402e6ad814d1b97a7af7ea255"

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
