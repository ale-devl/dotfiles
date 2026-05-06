#!/bin/bash

echo "Flushing DNS..."
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder

echo "Disabling and enabling Wi-Fi..."
sudo ifconfig en0 down
sleep 2
sudo ifconfig en0 up

echo "Restarting network services..."
sudo launchctl kickstart -k system/com.apple.networkd
