#!/bin/bash
echo "Select a Config to Delete a Snapshot From:"
configs=$(sudo snapper list-configs | awk 'NR>1 {print $1}')

select config in $configs "Exit to main menu"; do
    [ "$config" == "Exit to main menu" ] && break
    if [ -n "$config" ]; then
        echo "Select a Snapshot to Delete:"
        snapshots=$(sudo snapper -c "$config" list | awk 'NR>3 {print $1}')
        select snapshot in $snapshots "Exit to this menu"; do
            [ "$snapshot" == "Exit to this menu" ] && break
            if [ -n "$snapshot" ]; then
                sudo snapper -c "$config" delete "$snapshot" && echo "Snapshot $snapshot deleted from config $config"
                break
            fi
            echo "Invalid selection."
        done
        break
    fi
    echo "Invalid selection."
done

echo -e "\nPress Enter to return to the main menu."
read
