#!/bin/bash

# Source the utility functions
source "$(dirname "$0")/../lib/telegram.sh"
source "$(dirname "$0")/../config/app.conf"

message="Message from: $SERVER_NAME
"
err_message=''
for CONTAINER_NAME in ${CONTAINERS[@]}; do
    if ! docker ps | grep $CONTAINER_NAME > /dev/null; then
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
        message="${message}-Container $CONTAINER_NAME is running."
    fi
done

# send_message "$message"
send_message "$err_message"