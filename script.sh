#!/bin/bash

# Set default Downloads directory.  Allow override via command-line argument.
DOWNLOADS_DIR="${1:-$HOME/Downloads}"

# Define the folder paths for each category relative to DOWNLOADS_DIR
ZIP_DIR="$DOWNLOADS_DIR/zips"
VID_DIR="$DOWNLOADS_DIR/vids"
PIC_DIR="$DOWNLOADS_DIR/pics"
AUDIO_DIR="$DOWNLOADS_DIR/audio"

# Define file types for each category
ZIP_EXTENSIONS=("*.zip" "*.rar" "*.tar.gz" "*.7z")
VID_EXTENSIONS=("*.mp4" "*.mkv" "*.mov" "*.avi" "*.wmv")
PIC_EXTENSIONS=("*.jpg" "*.jpeg" "*.png" "*.gif" "*.bmp" "*.tiff")
AUDIO_EXTENSIONS=("*.mp3" "*.wav" "*.aac" "*.flac" "*.ogg")

# Create folders if they do not exist, handle errors
mkdir -p "$ZIP_DIR" "$VID_DIR" "$PIC_DIR" "$AUDIO_DIR" || {
  echo "Error creating directories. Check permissions and try again." >&2
  exit 1
}

# Function to move files of specified extensions to the target directory
move_files() {
  local extensions=("$@")
  local target_dir="${extensions[-1]}"
  unset 'extensions[-1]'

  # Use a single find command for efficiency
  find "$DOWNLOADS_DIR" -maxdepth 1 -type f \( -iname "${extensions[0]}" \
  $(for ((i=1; i<${#extensions[@]}; i++)); do echo "-o -iname \"${extensions[$i]}\""; done) \) -print0 | while IFS= read -r -d $'\0' file; do
    mv "$file" "$target_dir" || {
      echo "Error moving '$file' to '$target_dir'. Check permissions and try again." >&2
      continue
    }
    echo "Moved '$file' to '$target_dir'"
  done
}

# Ask for confirmation before moving files
read -p "Are you sure you want to move files? (y/n): " -r -n 1 response
if [[ "$response" =~ ^[Yy]$ ]]; then
  # Move files to respective folders
  echo "Moving files..."
  move_files "${ZIP_EXTENSIONS[@]}" "$ZIP_DIR"
  move_files "${VID_EXTENSIONS[@]}" "$VID_DIR"
  move_files "${PIC_EXTENSIONS[@]}" "$PIC_DIR"
  move_files "${AUDIO_EXTENSIONS[@]}" "$AUDIO_DIR"
  echo "Files moved successfully."
else
  echo "File move cancelled."
fi

# Move any remaining files to trash (with confirmation)
read -p "Move remaining files to trash? (y/n): " -r -n 1 response
if [[ "$response" =~ ^[Yy]$ ]]; then
  find "$DOWNLOADS_DIR" -maxdepth 1 -type f -exec trash {} \;
  echo "Remaining files moved to trash."
else
  echo "Trashing remaining files cancelled."
fi
