#!/usr/bin/env bash
set -euo pipefail

REPO_USER="Marki44"
REPO_NAME="ubuntu-tweaker"
BRANCH="main"

RAW_BASE="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/${BRANCH}"

OPT_URL="${RAW_BASE}/optimizer?v=$(date +%s)"
TM_URL="${RAW_BASE}/taskman?v=$(date +%s)"

echo "[+] Installing requirements..."
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends curl python3

echo "[+] Installing optimizer..."
sudo curl -fsSL "$OPT_URL" -o /usr/local/bin/optimizer
sudo chmod +x /usr/local/bin/optimizer

echo "[+] Installing taskman..."
sudo curl -fsSL "$TM_URL" -o /usr/local/bin/taskman
sudo chmod +x /usr/local/bin/taskman

echo
echo "[+] Installed."
echo "    Run anytime with: sudo optimizer"
echo

sudo /usr/local/bin/optimizer
