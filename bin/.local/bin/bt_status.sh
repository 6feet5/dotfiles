#!/usr/bin/env bash

# Create an i3status prepared string showing current bluetooth status
# Depend on: bluetoothctl, font with bluetooth icons

PWR=$(bluetoothctl show|grep "Powered: yes")

if [ -n "$PWR" ]; then
    NAME=$(bluetoothctl info|sed -n 's/.*Name: \(.*\)/\1/p')
    if [ -n "$NAME" ]; then
        OUTPUT="$NAME"
    else
        OUTPUT="[on]"
    fi
    echo $OUTPUT > /tmp/bt_status
else
    rm -f /tmp/bt_status
fi

