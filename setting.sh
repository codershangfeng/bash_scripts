#!/usr/bin/env bash

show_menu() {
    echo "*** MENU ***"
    echo "1. Add a Setting"
    echo "2. Delete a Setting"
    echo "3. View a Setting"
    echo "4. View All Settings"
    echo "Q – Quit"
}

check_setting_pattern() {
    if [[ -z $1 ]]; then
        echo "New setting not entered"
        return 1
    fi

    if [[ $1 != *"="* ]]; then
        echo "$1"
        echo "Invalid setting"
        return 1
    fi

    set -- `echo ${1} | tr '=' ' '`
    key=$1
    value=$2
    echo "The variable name of the setting is $key"
    echo "The variable value of the setting is $value"
    if [[ -z $1 ]] || [[ -z $2 ]]; then
        echo "Invalid setting."
        return 1
    fi
}

add_a_setting() {
    read -p "Enter setting (format: ABCD=abcd): " new_setting
    check_setting_pattern ${new_setting}
    if [[ "$?" != "0" ]]; then
        return 1
    fi
    echo "New setting added."
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
            break
        ;;
        '2')
            delete_a_setting
            break
        ;;
        '3')
            view_a_setting
            break
        ;;
        '4')
            view_all_settings
            break
        ;;
        'Q' | 'q')
            break
        ;;
        *) echo "Invalid choice."
    esac
    echo ""
done