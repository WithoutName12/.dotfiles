#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

MODE_PATH="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

if [[ $(id -u) -ne 0 ]]; then
    echo -e "${RED}Error:${RESET} missing root privilege."
    exit 1
fi

program_name=$(basename "$0")
help_message="$program_name: Usage: $program_name [option]
Options:
    status     Check status of conservation mode 
    on         Turn on conservation mode
    off        Turn off conservation mode
    help       Display this help message"

if [[ $# -ne 1 || "$1" == "help" ]]; then
    echo "$help_message"
    exit 0
fi

case "$1" in
on)
    echo 1 | sudo tee "$MODE_PATH" >/dev/null
    echo -e "${GREEN}$program_name: conservation mode turned ON.${RESET}"
    ;;
off)
    echo 0 | sudo tee "$MODE_PATH" >/dev/null
    echo -e "${GREEN}$program_name: conservation mode turned OFF.${RESET}"
    ;;
status)
    value=$(cat "$MODE_PATH")
    if [[ "$value" -eq 1 ]]; then
        echo -e "${YELLOW}$program_name: conservation mode is ON.${RESET}"
    else
        echo -e "${YELLOW}$program_name: conservation mode is OFF.${RESET}"
    fi
    ;;
*)
    echo -e "${RED}$program_name: Invalid option -- $1${RESET}"
    echo "Try '$program_name help' for more information."
    exit 1
    ;;
esac
