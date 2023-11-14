#!/bin/bash

delete_config() {
    echo "Select a Config to Delete:"
    configs=($(sudo snapper list-configs | awk 'NR>1 {print $1}'))
    if [ ${#configs[@]} -eq 0 ]; then
        echo "No configurations available."
        return
    fi

    PS3="Choose the configuration to delete (or '0' to cancel): "
    select opt in "${configs[@]}" "Cancel"; do
        if [[ $REPLY -eq 0 || "$opt" == "Cancel" ]]; then
            echo "Operation cancelled."
            break
        elif [[ $REPLY -gt 0 && $REPLY -le ${#configs[@]} ]]; then
            config=${configs[$REPLY-1]}
            sudo snapper -c "$config" delete-config
            echo "Config and all associated snapshots deleted for $config."
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done
}

delete_config
echo -e "\nPress Enter to return to the main menu."
read
