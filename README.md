Setup Simple PPTP VPN server for Ubuntu and Debian
==================================================

Script has been tested on Amazon EC2: Ubuntu Server 12.04.3 LTS

Digital Ocean: Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Debian 7 (Wheezy)

Rackspace: Ubuntu 12.04, Ubuntu 14.04

Licensed under GPL version 2 or any later version.

INSTALLATION INSTRUCTIONS
=========================

Amazon EC2
----------

Allow the following through the firewall ("security group")
- ICMP (all)
- TCP port 22 (SSH)
- TCP port 1723

Common
------
برای این کار نیاز به یک یوزر سودو ارید سپس مراحل زیر را انجام دهید
   
$     wget https://github.com/aliebadi65/vpn-ubunut/master/setup.sh

$     sudo sh setup.sh

Let the script run. Take note if the server external ip address
detection is succesful.  

Get your computer to use the VPN. Try googling for instructions, e.g.
https://www.google.com/#q=setup+pptp+windows+8

> Note: at least on Ubuntu Desktops and probably other Linuxes as well,
> you need to enable MPPE encryption from advanced settings!

Enjoy your very own (somewhat insecure) VPN!

Some notes
==========

Clients are configured to use Google public dns servers when
the vpn connection is active: https://developers.google.com/speed/public-dns/

Only one vpn account is generated.
To add more accounts, see the file /etc/ppp/chap-secrets

If you keep the vpn server generated with this script on the internet for a
long time (days or more), consider either restricting access to the ssh port on
the server by ip addresses to the networks you use, if you know the addresses
you are most likely to use or at least change ssh from port 22 to a random
port.

You can also specify you own username and password, run ` sh setup.sh -h` for help.

You can also specify you own username and password, run `sudo sh setup.sh -h` for help.
