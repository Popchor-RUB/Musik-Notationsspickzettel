#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_DIR="$ROOT_DIR/fonts"

BRAVURA_PATH="$FONT_DIR/Bravura.otf"
BRAVURA_URL="https://raw.githubusercontent.com/steinbergmedia/bravura/master/redist/otf/Bravura.otf"

NOTO_PATH="$FONT_DIR/NotoMusic-Regular.ttf"
NOTO_URL="https://raw.githubusercontent.com/notofonts/noto-fonts/main/unhinted/ttf/NotoMusic/NotoMusic-Regular.ttf"

download_if_missing() {
  local path="$1"
  local url="$2"
  if [[ -f "$path" ]]; then
    return
  fi

  echo "Downloading $(basename "$path")..."
  curl -fL --retry 3 --retry-delay 1 -o "$path" "$url"
}

if ! command -v typst >/dev/null 2>&1; then
  echo "Error: typst is not installed or not in PATH." >&2
  exit 1
fi

mkdir -p "$FONT_DIR"
download_if_missing "$BRAVURA_PATH" "$BRAVURA_URL"
download_if_missing "$NOTO_PATH" "$NOTO_URL"

INPUT_FILE="${1:-$ROOT_DIR/main.typ}"
OUTPUT_FILE="${2:-$ROOT_DIR/main.pdf}"
PREVIEW_DIR="${ROOT_DIR}/preview"
PREVIEW_PREFIX="${PREVIEW_DIR}/main"

echo "Compiling $(basename "$INPUT_FILE") -> $(basename "$OUTPUT_FILE")..."
typst compile --font-path "$FONT_DIR" "$INPUT_FILE" "$OUTPUT_FILE"

mkdir -p "$PREVIEW_DIR"
rm -f "${PREVIEW_PREFIX}"-*.png

if command -v pdftoppm >/dev/null 2>&1; then
  echo "Exporting preview images to $(basename "$PREVIEW_DIR")/ (pdftoppm)..."
  pdftoppm -png "$OUTPUT_FILE" "$PREVIEW_PREFIX"
elif command -v magick >/dev/null 2>&1; then
  echo "Exporting preview images to $(basename "$PREVIEW_DIR")/ (ImageMagick)..."
  magick -density 180 "$OUTPUT_FILE" "${PREVIEW_PREFIX}-%d.png"
else
  echo "Warning: No PDF-to-image tool found (need pdftoppm or ImageMagick)." >&2
  echo "Warning: Skipping preview image export." >&2
fi

echo "Done."
