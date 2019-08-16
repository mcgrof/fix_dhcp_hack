#!/bin/bash

TARGET="/etc/network/interfaces"

DATE=$(date)
echo "# Updated: $DATE" > $TARGET
echo "source-directory /etc/network/interfaces.d" >> $TARGET

enable_dhcp_dev()
{
	DEV=$1
	echo "auto $DEV"
	echo "allow-hotplug $DEV"
	echo "iface $DEV inet dhcp"
}

for i in /sys/class/net/*; do
	TARGET_DEV=$(basename $i)
	case "$TARGET_DEV" in
	"lo" | "tun")
		;;
	*)
		enable_dhcp_dev $TARGET_DEV >> $TARGET
		;;
	esac
done

systemctl restart networking.service
systemctl restart ssh.service
