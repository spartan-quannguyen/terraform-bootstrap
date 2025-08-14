#!/usr/bin/env bash
set -euo pipefail

APP_NAME="terraform-bootstrap"
SRC_DIR="./src"
BUILD_DIR="dist"

echo "🔹 Cleaning old builds..."
rm -rf build/ "$BUILD_DIR" *.spec

echo "🔹 Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt pyinstaller

echo "🔹 Building standalone binary..."
pyinstaller --onefile --name "$APP_NAME" "$SRC_DIR/main.py"

echo "🔹 Moving binary to /usr/local/bin (requires sudo)..."
sudo mv "$BUILD_DIR/$APP_NAME" /usr/local/bin/$APP_NAME

echo "✅ Installation complete!"
echo "You can now run: $APP_NAME"
