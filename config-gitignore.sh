#!/bin/bash

# Enable error handling
set -e

# Check if Git is installed
if ! [ -x "$(command -v git)" ]; then
  echo "Git is not installed. Please install Git and run this script again."
  exit 1
fi

# Define the path to .gitignore_global
global_gitignore=~/.gitignore_global

# Check if .gitignore_global already contains the entry
if grep -qF ".DS_Store" "$global_gitignore"; then
  # Count the number of occurrences of .DS_Store in .gitignore_global
  count=$(grep -c -F ".DS_Store" "$global_gitignore")

  if [ "$count" -gt 1 ]; then
    # Remove all but the first occurrence of .DS_Store
    sed -i '' '2,$ {/\.DS_Store/d;}' "$global_gitignore"
    echo "Removed duplicate .DS_Store entries from $global_gitignore."
  else
    echo ".DS_Store is already in $global_gitignore. No changes were made."
  fi
else
  # Add .DS_Store to ~/.gitignore_global
  echo ".DS_Store" >> "$global_gitignore"
  # Configure git to use ~/.gitignore_global
  git config --global core.excludesfile "$global_gitignore"
  echo "Git is now configured to ignore .DS_Store files globally."
fi

# Disable error handling
set +e