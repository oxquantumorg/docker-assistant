#!/bin/bash

# Source the utility functions
source "$(dirname "$0")/../lib/telegram.sh"
source "$(dirname "$0")/../config/app.conf"

message=''
err_message=''
for CONTAINER_NAME in ${CONTAINERS[@]}; do
    if ! docker ps | grep $CONTAINER_NAME > /dev/null; then
        err_message="${err_message}-Container $CONTAINER_NAME is not running.
"
    else
        message="${message}-Container $CONTAINER_NAME is running."
    fi
done

send_message "$message"
send_message "$err_message"