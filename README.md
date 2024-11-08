# Downloads Organizer Script

This script automates the organization of files in your Downloads directory. It moves files of specific types into designated subfolders.

## Features

* **Automated File Organization:**  Categorizes and moves files based on their extensions.
* **Customizable Categories:** Easily add or modify file types and their corresponding categories.
* **Error Handling:** Includes error checks for `mkdir` and `mv` commands.
* **Verbose Output:** Provides informative messages during execution.
* **Efficient File Handling:** Uses a single `find` command for improved performance.
* **User Confirmation:** Prompts the user for confirmation before moving files.
* **Specify Downloads Directory:** Allows specifying a custom downloads directory via command-line argument.
* **Trash Remaining Files:** Moves any remaining files to the trash after categorization (with user confirmation).


## Usage

1.  **Save the script:** Save the provided `script.sh` file.
2.  **Make it executable:** `chmod +x script.sh`
3.  **Run the script:** `./script.sh [downloads_directory]` (optional downloads_directory argument)

    *   If you want to use a different downloads directory than your default `$HOME/Downloads`, provide the path as a command-line argument.  For example: `./script.sh /path/to/my/downloads`

## Categories and File Extensions

The script currently supports the following categories and file extensions:

*   **Zips:** `.zip`, `.rar`, `.tar.gz`, `.7z`
*   **Vids:** `.mp4`, `.mkv`, `.mov`, `.avi`, `.wmv`
*   **Pics:** `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.tiff`
*   **Audio:** `.mp3`, `.wav`, `.aac`, `.flac`, `.ogg`

You can modify the `ZIP_EXTENSIONS`, `VID_EXTENSIONS`, `PIC_EXTENSIONS`, and `AUDIO_EXTENSIONS` arrays in the script to customize the categories and file extensions.

## Improvements

This script is an improvement over a previous version by including:

*   Robust error handling.
*   Informative output messages.
*   A more efficient `find` command for moving files.
*   User confirmation prompts.
*   The ability to specify a custom downloads directory.
