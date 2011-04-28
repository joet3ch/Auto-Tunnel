#!/bin/bash

ipaddr="10.20.0.41"

if ! ping -c 1 $ipaddr
    then
        logger "VPN tunnel not available - ping failed for $ipaddr"
        /opt/apps/auto_tunnel/tunnel_builder.sh &
fi
