cask "eligere" do
  version "1.4.3_27"
  sha256 "89a3cd765e87f2f4f298e7a6121a7c35f4e41679404af24e00798558a6696d11"

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
