#!/bin/bash
echo "Available Mount Points:"
mount_points=$(awk '$3 == "btrfs" {print $2}' /etc/fstab)

select opt in $mount_points "Exit to main menu"; do
    [ "$opt" == "Exit to main menu" ] && break
    if [ -n "$opt" ]; then
        read -p "Enter the name for the new config: " config_name
        sudo snapper -c "$config_name" create-config "$opt" && echo "Config created for $opt with name $config_name"
        break
    fi
    echo "Invalid selection."
done

echo -e "\nPress Enter to return to the main menu."
read
