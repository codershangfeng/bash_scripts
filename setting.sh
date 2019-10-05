#!/usr/bin/env bash

echo "*** MENU ***"
echo "1. Add a Setting"
echo "2. Delete a Setting"
echo "3. View a Setting"
echo "4. View All Settings"
echo "Q – Quit"

PS3="CHOICE: "
options=("1" "2" "3" "4" "Q")
select opt in "${options[@]}"
do
    case ${opt} in
        "1")
            echo "Enter setting (format: ABCD=abcd): "
            ;;
        "2")
            echo "Enter variable name: "
            ;;
        "3")
            echo "Enter variable name: "
            ;;
        "4")
            echo "Enter variable name: "
            ;;
        "Q")
            echo "$REPLY"
            break;
            ;;
        *)  echo "Invalid choice."
    esac
done