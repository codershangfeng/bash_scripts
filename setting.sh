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
    # Check if a new variable is entered.
    if [[ -z $1 ]]; then
        echo "New setting not entered"
        return 1
    fi

    # Check if the equal('=') symbol exists.
    if [[ $1 != *"="* ]]; then
        echo "Invalid setting"
        return 1
    fi

    # Check if the name or value of variable exists.
    set -- `echo ${1} | tr '=' ' '`
    key=$1
    value=$2
    echo "The variable name of the setting is $key"
    echo "The variable value of the setting is $value"
    if [[ -z $1 ]] || [[ -z $2 ]]; then
        echo "Invalid setting."
        return 1
    fi

    # Check the variable name is not a digit
    if [[ ${key} =~ ^[0-9] ]]; then
        echo "Invalid setting. The first character of a variable name cannot be a digit."
        return 1
    fi

    # Check if the variable exists in config.txt file.
    if grep -q "^${key}" ./config.txt; then
        echo "Variable exists. Changing the values of existing variables is not allowed."
        return 1
    fi
}

add_a_setting() {
    read -p "Enter setting (format: ABCD=abcd): " new_setting
    check_setting_pattern ${new_setting}
    if [[ "$?" != "0" ]]; then
        return 1
    fi
    echo ${new_setting} >> ./config.txt
    echo "New setting added."
    return 0
}

delete_a_setting() {
    read -p "Enter variable name: " deleting_setting
    variable=`grep "^$deleting_setting" ./config.txt`
    if [[ -z ${variable} ]]; then
        echo "Variable does not exist."
        return 1
    fi

    # Prompt for confirmation of deletion
    read -p "Delete this setting (y/n)? " yn
    case ${yn} in
        'Y' | 'y')
            sed -i '' "/$variable/d" ./config.txt
            echo "Setting deleted"
        ;;
        'N' | 'n')
            echo ""
        ;;
    esac

    return 0
}

view_a_setting() {
    read -p "Enter variable name: " existing_setting
    variable=`grep "^$existing_setting" ./config.txt`
    if [[ -z ${variable} ]]; then
        echo "Variable does not exist."
        return 1
    fi
    echo ${variable}
    echo "Requested setting displayed above."
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
        'Q' | 'q')
            break
        ;;
        *) echo "Invalid choice."
    esac
    echo ""
done