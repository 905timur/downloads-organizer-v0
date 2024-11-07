##Downloads Organizer Script

This script organizes files in the Downloads folder into separate folders based on their file types.

#Usage

To use this script, simply run it in your terminal. The script will create folders for each file type and move the files into their respective folders.

#Configuration

The script uses the following configuration variables:

    DOWNLOADS_DIR: The path to the Downloads folder (defaults to $HOME/Downloads)
    ZIP_DIR, VID_DIR, PIC_DIR, AUDIO_DIR: The paths to the folders for each file type (defaults to subfolders of DOWNLOADS_DIR)
    ZIP_EXTENSIONS, VID_EXTENSIONS, PIC_EXTENSIONS, AUDIO_EXTENSIONS: The file extensions for each file type

#Functions

    move_files(): Moves files of specified extensions to the target directory
