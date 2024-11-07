#!/bin/bash

# Define the Downloads folder path
DOWNLOADS_DIR="$HOME/Downloads"

# Define the folder paths for each category
ZIP_DIR="$DOWNLOADS_DIR/zips"
VID_DIR="$DOWNLOADS_DIR/vids"
PIC_DIR="$DOWNLOADS_DIR/pics"
AUDIO_DIR="$DOWNLOADS_DIR/audio"

# Define file types for each category
ZIP_EXTENSIONS=("*.zip" "*.rar" "*.tar.gz" "*.7z")
VID_EXTENSIONS=("*.mp4" "*.mkv" "*.mov" "*.avi" "*.wmv")
PIC_EXTENSIONS=("*.jpg" "*.jpeg" "*.png" "*.gif" "*.bmp" "*.tiff")
AUDIO_EXTENSIONS=("*.mp3" "*.wav" "*.aac" "*.flac" "*.ogg")

# Create folders if they do not exist
mkdir -p "$ZIP_DIR" "$VID_DIR" "$PIC_DIR" "$AUDIO_DIR"

# Function to move files of specified extensions to the target directory
move_files() {
  local extensions=("$@")
  local target_dir="${extensions[-1]}"
  unset 'extensions[-1]'

  for ext in "${extensions[@]}"; do
    find "$DOWNLOADS_DIR" -maxdepth 1 -type f -iname "$ext" -exec mv {} "$target_dir" \;
  done
}

# Move files to respective folders
move_files "${ZIP_EXTENSIONS[@]}" "$ZIP_DIR"
move_files "${VID_EXTENSIONS[@]}" "$VID_DIR"
move_files "${PIC_EXTENSIONS[@]}" "$PIC_DIR"
move_files "${AUDIO_EXTENSIONS[@]}" "$AUDIO_DIR"

# Move any remaining files to trash
find "$DOWNLOADS_DIR" -maxdepth 1 -type f -exec trash {} \;
