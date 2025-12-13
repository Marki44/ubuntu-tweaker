#!/usr/bin/env bash
set -euo pipefail

REPO_USER="Marki44"
REPO_NAME="ubuntu-tweaker"
BRANCH="main"
MAIN_FILE="optimizer"

RAW_BASE="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/${BRANCH}"
URL="${RAW_BASE}/${MAIN_FILE}"

echo "[+] Downloading: $URL"

sudo apt-get update -y
sudo apt-get install -y --no-install-recommends curl python3

curl -fsSL "$URL" -o "/tmp/${MAIN_FILE}"
chmod +x "/tmp/${MAIN_FILE}"

sudo "/tmp/${MAIN_FILE}"
