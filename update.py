import requests
import xml.etree.ElementTree as ET
import re
import hashlib
import sys


def get_latest_from_appcast():
    """Fetch latest version info from Sparkle appcast"""
    try:
        response = requests.get('https://update.eligere.dev/appcast.xml', timeout=30)
        response.raise_for_status()

        root = ET.fromstring(response.content)

        item = root.find('.//item')
        if not item:
            raise Exception("No items found in appcast")

        version = item.find('.//{http://www.andymatuschak.org/xml-namespaces/sparkle}version').text
        short_version = item.find('.//{http://www.andymatuschak.org/xml-namespaces/sparkle}shortVersionString').text
        print(version, short_version)

        download_url = "https://update.eligere.dev/Eligere_{}_{}_Installer_compressed.dmg".format(short_version, version)
        print(download_url)

        return {
            'version': f"{short_version}_{version}",
            'short_version': short_version,
            'build_version': version,
            'url': download_url
        }

    except Exception as e:
        print(f"Error fetching appcast: {e}")
        sys.exit(1)


def calculate_sha256(url):
    try:
        print(f"Downloading {url} to calculate SHA256...")
        response = requests.get(url, stream=True, timeout=60)
        response.raise_for_status()

        sha256_hash = hashlib.sha256()
        for chunk in response.iter_content(chunk_size=8192):
            sha256_hash.update(chunk)

        return sha256_hash.hexdigest()

    except Exception as e:
        print(f"Error calculating SHA256: {e}")
        sys.exit(1)


def read_current_cask():
    try:
        with open('Casks/eligere.rb', 'r') as f:
            return f.read()
    except FileNotFoundError:
        print("Cask file not found at Casks/eligere.rb")
        sys.exit(1)


def extract_current_version(cask_content):
    version_match = re.search(r'version\s+"([^"]+)"', cask_content)
    if version_match:
        return version_match.group(1)
    return None


def update_cask_file(cask_content, new_version, new_sha256):
    # Update version
    cask_content = re.sub(
        r'version\s+"[^"]+"',
        f'version "{new_version}"',
        cask_content
    )

    cask_content = re.sub(
        r'sha256\s+"[^"]+"',
        f'sha256 "{new_sha256}"',
        cask_content
    )

    return cask_content


def main():
    print("Checking for Eligere updates...")

    latest_info = get_latest_from_appcast()
    print(f"Latest version from appcast: {latest_info['version']}")

    current_cask = read_current_cask()
    current_version = extract_current_version(current_cask)
    print(f"Current version in cask: {current_version}")

    if current_version == latest_info['version']:
        print("No update needed. Versions match.")
        return False

    print(f"Update needed: {current_version} -> {latest_info['version']}")

    new_sha256 = calculate_sha256(latest_info['url'])
    print(f"New SHA256: {new_sha256}")

    updated_cask = update_cask_file(current_cask, latest_info['version'], new_sha256)

    with open('Casks/eligere.rb', 'w') as f:
        f.write(updated_cask)

    print("Cask file updated successfully")
    return True


needs_commit = main()

with open('update_needed.txt', 'w') as f:
    f.write('true' if needs_commit else 'false')
