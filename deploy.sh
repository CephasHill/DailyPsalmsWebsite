#!/usr/bin/env bash

# Daily Psalms website deployment script for Git Bash on Windows.
# Edit KEY_FILE and SERVER once, then run: ./deploy.sh

set -euo pipefail

SITE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KEY_FILE="C:\Users\peter\Documents\Website Keys\DailyPsalms.pem"
SERVER="ec2-user@54.165.134.251"
REMOTE_DIR="/usr/share/nginx/html"

if [[ "$SERVER" == *"YOUR_ELASTIC_IP"* ]]; then
  echo "Edit SERVER in deploy.sh and replace YOUR_ELASTIC_IP with your EC2 Elastic IP."
  exit 1
fi

if [[ ! -f "$KEY_FILE" ]]; then
  echo "SSH key not found: $KEY_FILE"
  echo "Update KEY_FILE in deploy.sh to the key's actual location."
  exit 1
fi

if [[ ! -f "$SITE_DIR/index.html" || \
      ! -f "$SITE_DIR/privacy.html" || \
      ! -f "$SITE_DIR/robots.txt" || \
      ! -f "$SITE_DIR/sitemap.xml" || \
      ! -d "$SITE_DIR/images" ]]; then
  echo "Expected index.html, privacy.html, robots.txt, sitemap.xml, and images/ next to this script."
  exit 1
fi

echo "Backing up the current live index.html..."
ssh -i "$KEY_FILE" "$SERVER" \
  "sudo cp '$REMOTE_DIR/index.html' '$REMOTE_DIR/index.html.backup'"

echo "Uploading website files and images..."
tar -czf - -C "$SITE_DIR" index.html privacy.html robots.txt sitemap.xml images | \
  ssh -i "$KEY_FILE" "$SERVER" \
  "sudo tar -xzf - -C '$REMOTE_DIR'"

echo "Setting readable website permissions..."
ssh -i "$KEY_FILE" "$SERVER" \
  "sudo find '$REMOTE_DIR/images' -type d -exec chmod 755 {} \\; && sudo find '$REMOTE_DIR/images' -type f -exec chmod 644 {} \\;"

echo "Deployment complete: https://dailypsalms.click"
