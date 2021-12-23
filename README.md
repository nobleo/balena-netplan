# balena-netplan

Balena doesn't support netplan by default.

This image provides network setup by means of netplan.

## Usage

Example usage in a docker-compose file:

```yaml
  balena-netplan:
    image: nobleo/balena-netplan
    privileged: true
    network_mode: host
    labels:
      io.balena.features.dbus: '1'
    environment:
      DBUS_SYSTEM_BUS_ADDRESS: unix:path=/host/run/dbus/system_bus_socket
      CONFIG_FILE_CONTENT: |
        network:
          version: 2
          ethernets:
            eth0:
              dhcp4: no
              dhcp6: no
              addresses:
                - 192.168.10.30/24
```

## See also
https://github.com/nobleo/avahi-chrony.git
