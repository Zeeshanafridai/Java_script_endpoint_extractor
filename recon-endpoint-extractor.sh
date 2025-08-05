#!/bin/bash

# === USAGE ===
# ./extract-full-endpoints.sh -i jsfiles.txt -o all_full_urls.txt

# === CONFIG ===
LINKFINDER="/home/z33/Desktop/recon/LinkFinder/linkfinder.py"

# === ARG PARSE ===
while getopts ":i:o:" opt; do
  case $opt in
    i) JSFILE="$OPTARG" ;;
    o) OUTPUT="$OPTARG" ;;
    \?) echo "❌ Invalid option -$OPTARG"; exit 1 ;;
    :) echo "❌ Option -$OPTARG requires an argument."; exit 1 ;;
  esac
done

if [ -z "$JSFILE" ] || [ -z "$OUTPUT" ]; then
  echo "❗ Usage: $0 -i <js_urls_file.txt> -o <output_file.txt>"
  exit 1
fi

# === CLEAN OUTPUT ===
> "$OUTPUT"

echo "[*] Extracting all endpoints from: $JSFILE"

# === MAIN LOOP ===
while read jsurl; do
  echo "[*] Scanning $jsurl"
  base=$(echo "$jsurl" | sed -E 's|(https?://[^/]+).*|\1|')

  python3 "$LINKFINDER" -i "$jsurl" -o cli 2>/dev/null | while read path; do
    # Only include valid-looking relative paths
    if [[ "$path" == /* ]]; then
      echo "$base$path" >> "$OUTPUT"
    fi
  done

done < "$JSFILE"

echo "✅ Done. Saved all full endpoints (even dead ones) to: $OUTPUT"

