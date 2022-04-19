#!/bin/bash

LOCAL=$HOME
REMOTE="onedrive:WSL"

function rclone_sync() {
    rclone sync --include-from $HOME/wsl-setup/sync-include $1 $2 $3
    rclone sync --exclude-from $HOME/wsl-setup/sync-exclude $1 $2 $3
}

if [[ $2 == "-i" ]]; then
    FLAG="-i"
elif [[ $2 == "" ]]; then
    FLAG="--dry-run"
elif [[ $2 == "-y" ]]; then
    FLAG=""
fi

echo "Selected flag: $FLAG"

if [[ $1 == "upload" ]]; then
    rclone_sync $LOCAL $REMOTE $FLAG
elif [[ $1 == "download" ]]; then
    rclone_sync $REMOTE $LOCAL $FLAG
else
    echo "Invalid flag: $1"
fi
