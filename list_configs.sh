#!/bin/bash
echo "Listing Snapper Configurations:"
sudo snapper list-configs | awk 'NR>1 {print $1}'
echo -e "\nPress Enter to return to the main menu."
read
