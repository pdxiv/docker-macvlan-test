#!/bin/bash

PARENT_INTERFACE=`ip route | perl -nle 'print $1 if /^default.* dev (\S+)/'`
MACVLAN_INTERFACE=macvlan0

# Create macvlan interface on the host, name it and link  it to the original interface
ip link add dev $MACVLAN_INTERFACE link $PARENT_INTERFACE type macvlan

# Optionally, you can specify the mac for this new interface. If this isn't done, a random one will be used
ip link set $MACVLAN_INTERFACE addr 56:12:bd:c1:bc:5c

# Bring up the interface
ip link set $MACVLAN_INTERFACE up

# Run dhclient on the new interface, to get it a new lease
dhclient $MACVLAN_INTERFACE -v
