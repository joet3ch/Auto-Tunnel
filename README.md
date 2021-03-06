#Auto Tunnel

###A utility that tries to keep a vpn tunnel established using *vpnc*

I run a vm on my network that acts as a gateway for the vpn tunnel. This eliminates the need for any vpn client apps and I can access the tunnel from any node on my network. These are the scripts I quickly hacked together and they work well for me, but could be improved.


**Requirements** (this is what I tested on):
	
	Ubuntu Linux 10.04 (2.6.32-24-server)
	vpnc 0.5.3 (if you need it - 'sudo apt-get install vpnc')
	access to an ipsec endpoint


**Install**

Overview: Run the installer, modify the config, enjoy an always-connected vpn tunnel


**perform these steps as root ('sudo -i')**

1 - Change launcher perms 

>chmod 755 install.sh

2 - Run the installer 

>./install.sh

3 - Modify the configuration (backup the originals first)

>sudo vi /etc/auto_tunnel.conf 

4 - Modify */opt/apps/auto_tunnel/link_checker.sh* and replace the value for *ipaddr* with an address available on the destination network. Make sure that you can receive ping responses from this address.


**Optional** Act as a gateway and route traffic from other nodes through this tunnel

1 - add routes to this host on your routers for the netblocks you want to access via the tunnel

2 - enable forwarding via iptables

>modify *examples/iptables.sav* and append it to your */etc/iptables.sav*
