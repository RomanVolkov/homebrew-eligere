cask "eligere" do
  version "1.4.4_28"
  sha256 "91ebcf64a7309dc27d1c33549c0f01490076db1fd507bc1e7142e48f310df8eb"

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
