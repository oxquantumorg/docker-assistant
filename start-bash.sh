#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Change permissions and run monitor-bash.sh using the dynamic path
chmod 777 "$SCRIPT_DIR"
"$SCRIPT_DIR/bin/monitor-bash.sh"
