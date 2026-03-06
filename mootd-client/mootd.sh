#!/usr/bin/env bash

RENEWAL_TIME="24:00:00"
MOOTD_PATH="$HOME/.mootd"
MOOTD_URL="https://mootd.samcole.me"

# Convert HH:MM:SS to seconds
IFS=: read -r h m s <<< "$RENEWAL_TIME"
renewal_seconds=$((10#$h*3600 + 10#$m*60 + 10#$s))

now=$(date -u +%s)

# Get file mtime
if [[ -f "$MOOTD_PATH" ]]; then
    mootd_time=$(date -u -r "$MOOTD_PATH" +%s)
else
    mootd_time=0
fi

age=$((now - mootd_time))

# Refresh MOOTD if file has expired
if (( age >= renewal_seconds )); then
    tmp=$(mktemp)

    if curl -fsSL --connect-timeout 5 "$MOOTD_URL" -o "$tmp"; then
        mv "$tmp" "$MOOTD_PATH"
    else
        rm -f "$tmp"
    fi
fi

[[ -f "$MOOTD_PATH" ]] && cat "$MOOTD_PATH"