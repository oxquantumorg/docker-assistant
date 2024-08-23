#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Change permissions and run monitor-bash.sh using the dynamic path
chmod +x "$SCRIPT_DIR/bin/monitor-bash.sh"
"$SCRIPT_DIR/bin/monitor-bash.sh"
