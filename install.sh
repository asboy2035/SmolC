#!/bin/bash

echo "💅 Installing SmolC from GitHub..."

# Get Espanso package path dynamically
PKG_DIR=$(espanso path | grep "Packages:" | cut -d':' -f2- | xargs)

if [ -z "$PKG_DIR" ]; then
  echo "❌ Could not detect Espanso package path!"
  exit 1
fi

# Define destination folder
DEST="$PKG_DIR/smolc"

echo "📦 Installing to: $DEST"

# Clone the repo to a temp directory
git clone https://github.com/asboy2035/SmolC.git /tmp/smolc-temp

# Make sure the folder exists
mkdir -p "$DEST"

# Copy the package files
cp -r /tmp/smolc-temp/* "$DEST"

# Clean up temp files
rm -rf /tmp/smolc-temp

# Restart Espanso
espanso restart

echo "✅ SmolC installed successfully!"
