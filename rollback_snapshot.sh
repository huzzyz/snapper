#!/bin/bash
echo "Select a Config to Rollback:"
configs=$(sudo snapper list-configs | awk 'NR>1 {print $1}')

select config in $configs "Exit to main menu"; do
    [ "$config" == "Exit to main menu" ] && break
    if [ -n "$config" ]; then
        echo "Select a Snapshot to Rollback To:"
        snapshots=$(sudo snapper -c "$config" list | awk 'NR>3 {print $1}')
        select snapshot in $snapshots "Exit to this menu"; do
            [ "$snapshot" == "Exit to this menu" ] && break
            if [ -n "$snapshot" ]; then
                sudo snapper -c "$config" rollback "$snapshot" && echo "System rolled back to snapshot $snapshot in config $config"
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
