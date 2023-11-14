#!/bin/bash
echo "Select a Config for Creating a Snapshot:"
configs=$(sudo snapper list-configs | awk 'NR>1 {print $1}')

select config in $configs "Exit to main menu"; do
    [ "$config" == "Exit to main menu" ] && break
    if [ -n "$config" ]; then
        sudo snapper -c "$config" create --description "Manual snapshot" && echo "Snapshot created for config $config"
        break
    fi
    echo "Invalid selection."
done

echo -e "\nPress Enter to return to the main menu."
read
