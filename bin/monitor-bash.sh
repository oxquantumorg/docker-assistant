#!/bin/bash

SCRIPT_DIR=$(dirname "$(dirname "$(realpath "$0")")")
# Source the utility functions
source "$SCRIPT_DIR/lib/telegram.sh"
source "$SCRIPT_DIR/config/app.conf"

err_message=''
message=" 
"

for CONTAINER_NAME in "${SCRIPTS[@]}"; do
    KEY="${CONTAINER_NAME%%:*}"
    VALUE="${CONTAINER_NAME##*:}"
    printf "%s likes to %s \n" "$KEY" "$VALUE"
done

for SCRIPT_MAP in ${SCRIPTS_MAP[@]}; do
    CONTAINER_NAME="${SCRIPT_MAP%%:*}"
    SCRIPT="${SCRIPT_MAP##*:}"
    if ! docker ps | grep $CONTAINER_NAME > /dev/null; then
err_message="${err_message}______________________________________________
"
err_message="${err_message}-Container $CONTAINER_NAME is not running. Restarting...
"
        bash "$SCRIPTS_PATH/$SCRIPT"
        if [ $? -eq 0 ]; then
err_message+="Successfully restarted $CONTAINER_NAME.
"
        else
err_message+="Failed to restart $CONTAINER_NAME.
"
        fi
    else
        message="${message}-Container $CONTAINER_NAME is running.
"
    fi
done

# send_message "$message"
send_message "$err_message"