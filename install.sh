#!/bin/bash

echo "💅 Installing or Updating SmolC..."

# Get espanso packages path
PKG_DIR=$(espanso path | grep "Packages:" | cut -d':' -f2- | xargs)
DEST="$PKG_DIR/smolc"
TEMP_DIR="/tmp/smolc-temp"

# Clone GitHub version to temp dir
echo "📥 Cloning latest SmolC from GitHub..."
git clone --quiet https://github.com/asboy2035/SmolC.git "$TEMP_DIR"

# Get GitHub version from _manifest.yml
if [ ! -f "$TEMP_DIR/_manifest.yml" ]; then
  echo "❌ Could not find _manifest.yml in GitHub repo! Please contact the maintainer: ash@asboy2035.com"
  rm -rf "$TEMP_DIR"
  exit 1
fi
GITHUB_VERSION=$(grep "^version:" "$TEMP_DIR/_manifest.yml" | cut -d'"' -f2)

# Check if already installed
if [ -f "$DEST/_manifest.yml" ]; then
  INSTALLED_VERSION=$(grep "^version:" "$DEST/_manifest.yml" | cut -d'"' -f2)

  echo "🧾 Installed version: $INSTALLED_VERSION"
  echo "🌐 GitHub version: $GITHUB_VERSION"

  if [ "$(printf "%s\n%s" "$GITHUB_VERSION" "$INSTALLED_VERSION" | sort -V | tail -n1)" = "$INSTALLED_VERSION" ]; then
    echo "✅ SmolC is already up-to-date. Check back later!"
    rm -rf "$TEMP_DIR"
    exit 0
  else
    echo "🔁 Updating installed SmolC version $GITHUB_VERSION..."
    rm -rf "$DEST"
  fi
else
  echo "✨ SmolC not installed yet. Installing fresh!"
fi

# Create destination directory
mkdir -p "$DEST"

# Copy new files
cp -r "$TEMP_DIR"/* "$DEST"

# Clean up temp
rm -rf "$TEMP_DIR"

# Restart espanso
espanso restart

echo "✅ SmolC v$GITHUB_VERSION installed successfully!"
