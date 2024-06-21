#!/bin/bash

# Function to rename files
rename_files() {
  for file in "$1"/*; do
    if [ -d "$file" ]; then
      # If the file is a directory, recursively call rename_files
      rename_files "$file"
    elif [ -f "$file" ]; then
      # If the file contains a question mark, rename it
      if [[ "$file" == *\?* ]]; then
        # Get the directory and the base name
        dir=$(dirname "$file")
        base=$(basename "$file")
        # Get the part before the question mark
        new_base=${base%%\?*}
        # Rename the file
        mv "$file" "$dir/$new_base"
      fi
    fi
  done
}

# Start the renaming process from the current directory
rename_files .

