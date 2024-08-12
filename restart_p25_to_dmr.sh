#!/bin/bash

# P25 to DMR Bridge Restart Script

echo "Stopping and restarting P25 to DMR Bridge components..."

# Stop any running instances
sudo killall P25Gateway
sudo killall Analog_Bridge
sudo killall MMDVM_Bridge

# Start new instances
screen -dmS P25Reflector su - p25reflector -c "cd /usr/local/bin && ./P25Reflector.sh start /etc/P25Gateway.ini"
screen -dmS P25Gateway su - p25reflector -c "cd /opt/P25Gateway && ./P25Gateway /etc/P25Gateway.ini"
screen -dmS AnalogBridgeDMR su - p25reflector -c "cd /opt/Analog_Bridge && ./Analog_Bridge_DMR /etc/Analog_Bridge_DMR.ini"
screen -dmS AnalogBridgeP25 su - p25reflector -c "cd /opt/Analog_Bridge && ./Analog_Bridge_P25 /etc/Analog_Bridge_P25.ini"
screen -dmS MMDVM_Bridge su - p25reflector -c "sudo systemctl stop mmdvm_bridge.service && cd /opt/MMDVM_Bridge && ./MMDVM_Bridge /etc/MMDVM_Bridge.ini"

echo "P25 to DMR Bridge components restarted. Use 'screen -ls' to view running sessions."

