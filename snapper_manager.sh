#!/bin/bash

show_menu() {
    clear
    echo "--------------------------------"
    echo "  Snapper Management Script"
    echo "--------------------------------"
    echo "1. List Subvolumes"
    echo "2. List Snapper Configs"
    echo "3. Create a New Snapper Config"
    echo "4. Delete a Snapper Config"
    echo "5. Create a Manual Snapshot"
    echo "6. Delete a Snapshot"
    echo "7. Rollback to a Snapshot"
    echo "8. List All Snapshots"
    echo "9. Update GRUB"
    echo "10. Exit"
    echo "--------------------------------"
    echo -n "Please enter your choice: "
}

while true; do
    show_menu
    read -r choice
    case $choice in
        1) ./list_subvolumes.sh ;;
        2) ./list_configs.sh ;;
        3) ./create_config.sh ;;
        4) ./delete_config.sh ;;
        5) ./create_snapshot.sh ;;
        6) ./delete_snapshot.sh ;;
        7) ./rollback_snapshot.sh ;;
        8) ./list_snapshots.sh ;;
        9) ./update_grub.sh ;;
        10) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
