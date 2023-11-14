#!/bin/bash
echo "Listing Btrfs Subvolumes:"
sudo btrfs subvolume list / | awk '{print $NF}'
echo -e "\nPress Enter to return to the main menu."
read
