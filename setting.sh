#!/usr/bin/env bash

show_menu() {
    echo "*** MENU ***"
    echo "1. Add a Setting"
    echo "2. Delete a Setting"
    echo "3. View a Setting"
    echo "4. View All Settings"
    echo "Q – Quit"
}

add_a_setting() {
    echo "Enter setting (format: ABCD=abcd): "
    return 0
}

delete_a_setting() {
    echo "Enter variable name: "
    return 0
}

view_a_setting() {
    echo "Enter variable name: "
    return 0
}

view_all_settings() {
    echo ""
    cat ./config.txt
    return 0
}

while true; do
    show_menu
    read -p "CHOICE: " opt
    case ${opt} in
        '1')
            add_a_setting
        ;;
        '2')
            delete_a_setting
        ;;
        '3')
            view_a_setting
        ;;
        '4')
            view_all_settings
        ;;
        'Q'|'q')
            break
        ;;
        *) echo "Invalid choice."
    esac
    echo ""
done