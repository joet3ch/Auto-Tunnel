#!/bin/bash

## copy scripts
mkdir -p /opt/apps/auto_tunnel
cp -r source/link_checker.sh /opt/apps/auto_tunnel/link_checker.sh
cp -r source/tunnel_builder.sh /opt/apps/auto_tunnel/tunnel_builder.sh
chmod 755 /opt/apps/auto_tunnel/link_checker.sh
chmod 755 /opt/apps/auto_tunnel/tunnel_builder.sh

## copy config
cp auto_tunnel.conf /etc/auto_tunnel.conf
chmod 644 /etc/auto_tunnel.conf

## replace vpnc default script (this just forces the machine to not route ALL traffic thru tunnel)
mv /etc/vpnc/vpnc-script /etc/vpnc/vpnc-script.orig-auto_tunnel
cp source/vpnc-script /etc/vpnc/vpnc-script
chmod 755 /etc/vpnc/vpnc-script

## add cron job
crontab -l > /tmp/auto_tunnel_tmp_cron_file
echo "*/5 * * * * /opt/apps/auto_tunnel/link_checker.sh &" | tee -a /tmp/auto_tunnel_tmp_cron_file
crontab /tmp/auto_tunnel_tmp_cron_file
rm /tmp/auto_tunnel_tmp_cron_file