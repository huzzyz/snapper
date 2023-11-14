#!/bin/bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB configuration updated."
echo -e "\nPress Enter to return to the main menu."
read
