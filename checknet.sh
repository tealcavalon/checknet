#! /bin/sh
# Checks if the dns resolve is up.  If not, it tries to restart
# the network devices.  If that fails, then reboot.
if ping -c 1 google.com > /dev/null
        then
                echo "All seams ok! :-D" > /var/log/checknet_status.log
                date >> /var/log/checknet_status.log
else
        /etc/init.d/network restart
        /etc/init.d/dnsmasq restart
        sleep 20
		/etc/init.d/hostapd restart
		/etc/init.d/tunnel.sh stop
		/etc/init.d/tunnel.sh start
        sleep 30
if ping -c google.com > /dev/null
        then
                echo "All seams ok! :-D" > /var/log/checknet_status.log
                date >> /var/log/checknet_status.log
        else
                echo "Something went wrong, rebooting this shit..." >> /var/log/checknet_reboot.log
                date >> /var/log/checknet_reboot.log
                reboot
        fi
fi
