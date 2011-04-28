#!/bin/bash

vpnc --dpd-idle 0 /etc/auto_tunnel.conf &
sleep 5

route add -net 10.20.0.0/16 dev tun0
route add -net 10.80.0.0/16 dev tun0
route add -net 192.168.77.0/24 dev tun0

iptables-restore < /etc/iptables.sav