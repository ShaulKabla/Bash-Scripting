#!/bin/bash

echo "Updating package lists and upgrading installed packages"
apt update && sudo apt upgrade -y

echo "Cleaning up unnecessary files..."
sudo apt autoremove -y
sudo apt autoclean

echo "System update and cleanup complete."
