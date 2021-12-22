#!/bin/bash

if [ -z "$CONFIG_FILE" ]
then
    if [ -z "$CONFIG_FILE_CONTENT" ]
    then
        echo "Either CONFIG_FILE or CONFIG_FILE_CONTENT needs to be set as environment variable"
        exit 1
    else
        CONFIG_FILE=/etc/netplan/netplan.yaml
        echo "$CONFIG_FILE_CONTENT" > "$CONFIG_FILE"
    fi
fi

echo "Config file content:"
cat "$CONFIG_FILE"

# Start systemd binary
echo "Starting systemd"
sleep infinity &
exec env DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket /sbin/init quiet systemd.show_status=0
