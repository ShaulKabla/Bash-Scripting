#!/bin/bash

echo "Updating and upgrading"
apt update && sudo apt upgrade -y

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

echo "System update and cleanup complete."
