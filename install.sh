#!/bin/bash

echo "💅 Installing SmolC from GitHub..."

# Clone the repo
git clone https://github.com/asboy2035/SmolC.git /tmp/smolc-temp

# Get Espanso packages path
ESPANSO_PATH=$(espanso path | grep -i 'config' | head -n 1)
PKG_DIR="$ESPANSO_PATH/packages/smolc"

# Make sure the path exists
mkdir -p "$PKG_DIR"

# Copy to the packages directory
cp -r /tmp/smolc-temp/* "$PKG_DIR"

# Cleanup temp
rm -rf /tmp/smolc-temp

# Restart Espanso
espanso restart

echo "SmolC installed successfully!"
echo "You can now smolify your C with max slay."
