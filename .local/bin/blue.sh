#!/bin/bash

BLOCKED=$(rfkill list bluetooth | grep "Soft" | cut -d ' ' -f 3)

if [[ "$BLOCKED" == "yes" ]]; then
    rfkill unblock bluetooth
    dunstify -i ~/.icons/status/bluetooth-on.svg \
    "Bluetooth" "Bluetooth is turned ON"

    sleep 1

bluetoothctl <<'EOF'
connect 88:C6:26:AB:59:F0
EOF

else

bluetoothctl <<'EOF'
disconnect 88:C6:26:AB:59:F0
EOF

    sleep 1

    rfkill block bluetooth
    dunstify -i ~/.icons/status/bluetooth-off.svg \
    "Bluetooth" "Bluetooth is turned OFF"
fi
