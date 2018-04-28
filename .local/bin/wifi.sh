#!/bin/bash

BLOCKED=$(rfkill list wifi | grep "Soft" | cut -d ' ' -f 3)

if [[ "$BLOCKED" == "yes" ]]; then
    rfkill unblock wifi
    dunstify -i ~/.icons/status/wifi-on.svg \
    "Wi-Fi" "Wi-Fi is turned ON"
else
    rfkill block wifi
    dunstify -i ~/.icons/status/wifi-off.svg \
    "Wi-Fi" "Wi-Fi is turned OFF"
fi
