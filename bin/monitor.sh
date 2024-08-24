#!/bin/bash

SCRIPT_DIR=$(dirname "$(dirname "$(realpath "$0")")")
# Source the utility functions
source "$SCRIPT_DIR/lib/telegram.sh"
source "$SCRIPT_DIR/config/app.conf"

# Ensure err_message and message are initialized
err_message=""
message=" 
"

for CONTAINER_NAME in "${CONTAINERS[@]}"; do
    if ! docker ps | grep -q "$CONTAINER_NAME"; then
        err_message="${err_message}______________________________________________
"
        err_message="${err_message}-Container $CONTAINER_NAME is not running. Restarting...
"
        docker restart "$CONTAINER_NAME"
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

send_message "$message"
send_message "$err_message"