#!/bin/bash
TOKEN=""
CHAT_ID=""
curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE" > /dev/null

# if ! docker ps | grep $CONTAINER_NAME > /dev/null; then
#     sendTgMessage.sh "Container $CONTAINER_NAME is not running. Sending email..."
#     sendTgMessage.sh "Container $CONTAINER_NAME is not running on $(hostname)." | mail -s "$CONTAINER_NAME Container not running" $EMAIL_TO
# else
#     sendTgMessage.sh "Container $CONTAINER_NAME is running."
# fi