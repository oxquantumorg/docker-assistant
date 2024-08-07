#!/bin/bash

# Source the configuration
source "$(dirname "$0")/../config/app.conf"

function send_message() {
    local message=$1
    curl -s -X POST https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage -d chat_id=$ADMIN_CHAT_ID -d text="$message" > /dev/null
    echo "[INFO] $message"
}
