#!/bin/bash

# Enable verbose output
set -x

# Add .DS_Store to ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global

# Configure git to use ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Disable verbose output
set +x
