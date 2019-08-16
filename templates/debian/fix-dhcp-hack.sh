#!/bin/bash

TARGET="/etc/network/interfaces"

echo "source-directory /etc/network/interfaces.d" > $TARGET

enable_dhcp_dev()
{
	DEV=$1
	echo "auto $DEV"
	echo "allow-hotplug $DEV"
	echo "iface $DEV inet dhcp"
}

for i in $(/sys/class/net/*); do
	case "$i" in
	"lo" | "tun")
		;;
	*)
		enable_dhcp_dev $i >> $TARGET
		;;
	esac
done
