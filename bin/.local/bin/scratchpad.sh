#!/bin/bash

# Quit if there already is a scratchpad available
if ! pgrep scratchpad >/dev/null; then
    exit 0
fi

# Restart scratchpad in case it is closed
while true; do
	alacritty -t scratchterm
done
