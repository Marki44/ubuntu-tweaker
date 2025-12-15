#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

if [ -d "${SCRIPT_DIR}/.git" ]; then
  echo "[+] This is a git repository. Checking for updates..."
  cd "${SCRIPT_DIR}"
  git pull
  echo "[+] Update check complete."
fi

echo "[+] Installing requirements..."
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends python3

echo "[+] Installing optimizer..."
sudo cp "${SCRIPT_DIR}/optimizer" /usr/local/bin/optimizer
sudo chmod +x /usr/local/bin/optimizer

echo "[+] Installing taskman..."
sudo cp "${SCRIPT_DIR}/taskman" /usr/local/bin/taskman
sudo chmod +x /usr/local/bin/taskman

echo
echo "[+] Installed."
echo "    Run anytime with: sudo optimizer"
echo

sudo /usr/local/bin/optimizer
