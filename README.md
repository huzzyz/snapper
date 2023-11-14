# snapper
1. snapper_manager.sh
Function: Acts as the main menu for the Snapper Management System.
Features:
Displays a menu with options for managing Btrfs subvolumes and Snapper configurations.
Allows users to navigate to various functionalities like creating/deleting snapshots, listing subvolumes, managing Snapper configurations, and updating GRUB.
Handles user input to call other scripts based on the selected option.
2. list_subvolumes.sh
Function: Lists all Btrfs subvolumes.
Features:
Uses btrfs subvolume list command to display all Btrfs subvolumes on the system.
Provides an easy way to view all subvolumes, which is useful for creating Snapper configurations.
3. list_configs.sh
Function: Lists all existing Snapper configurations.
Features:
Uses snapper list-configs to display all current Snapper configurations.
Helps users see which configurations are already set up.
4. create_config.sh
Function: Creates a new Snapper configuration for a specified subvolume.
Features:
Reads mount points from /etc/fstab to present a list of available subvolumes for snapshotting.
Allows users to select a mount point and enter a name for the new Snapper configuration.
Creates a new Snapper configuration for the selected subvolume.
5. delete_config.sh
Function: Deletes an existing Snapper configuration.
Features:
Lists all Snapper configurations and allows users to select one for deletion.
Deletes the selected Snapper configuration along with all associated snapshots.
6. create_snapshot.sh
Function: Creates a manual snapshot for a selected Snapper configuration.
Features:
Lists all Snapper configurations and allows users to select one.
Creates a new snapshot for the selected configuration.
7. delete_snapshot.sh
Function: Deletes a specific snapshot from a selected Snapper configuration.
Features:
Allows users to select a Snapper configuration and then a specific snapshot within that configuration.
Deletes the selected snapshot.
8. rollback_snapshot.sh
Function: Rolls back the system state to a selected snapshot.
Features:
Presents a list of Snapper configurations and snapshots within the selected configuration.
Rolls back the system state to the state captured in the selected snapshot.
9. list_snapshots.sh
Function: Lists all snapshots for a selected Snapper configuration.
Features:
Allows users to select a Snapper configuration.
Lists all snapshots within the selected configuration.
10. update_grub.sh
Function: Updates the GRUB configuration.
Features:
Runs grub-mkconfig to update the GRUB boot menu, which is essential if grub-btrfs is used to include snapshots in the GRUB menu.
Each script is designed to perform a specific task, making the system modular and easy to manage.
