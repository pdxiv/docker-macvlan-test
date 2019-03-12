#!/bin/bash

MACVLAN_INTERFACE=macvlan0

ip link set $MACVLAN_INTERFACE down
ip link delete $MACVLAN_INTERFACE
