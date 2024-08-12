#!/bin/bash

# P25 to DMR Bridge Install Script

echo "Starting P25 to DMR Bridge installation..."

# Prompt user for input
read -p "Enter your callsign: " CALLSIGN
read -p "Enter your DMR ID: " DMR_ID
read -p "Enter your P25 Talkgroup: " P25_TG
read -p "Enter your BrandMeister Server: " BM_SERVER
read -p "Enter your BrandMeister Password: " BM_PASSWORD

# Update system and install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt-get install build-essential git net-tools wget screen -y

# Create user and set permissions
sudo adduser p25reflector
sudo usermod -aG sudo p25reflector

# Switch to p25reflector user
su - p25reflector

# Create Downloads directory and clone repositories
mkdir -p ~/Downloads
cd ~/Downloads
git clone https://github.com/g4klx/P25Clients.git
cd P25Clients
git clone https://github.com/nostar/DVReflectors.git

# Configure P25Reflector
sudo cp P25Clients/DVReflectors/P25Reflector.ini /etc
sudo sed -i "s/YOURCALLSIGN/$CALLSIGN/g" /etc/P25Reflector.ini

# Configure P25Gateway
sudo cp P25Clients/P25Gateway/P25Gateway.ini /etc
sudo sed -i "s/YOURCALLSIGN/$CALLSIGN/g" /etc/P25Gateway.ini
sudo sed -i "s/YOUR_DMR_ID/$DMR_ID/g" /etc/P25Gateway.ini
sudo sed -i "s/YOUR_P25_TG/$P25_TG/g" /etc/P25Gateway.ini

# Configure Analog Bridge
sudo cp P25Clients/Analog_Bridge/Analog_Bridge_P25.ini /etc
sudo cp P25Clients/Analog_Bridge/Analog_Bridge_DMR.ini /etc
sudo sed -i "s/YOUR_DMR_ID/$DMR_ID/g" /etc/Analog_Bridge_P25.ini
sudo sed -i "s/YOUR_DMR_ID/$DMR_ID/g" /etc/Analog_Bridge_DMR.ini

# Configure MMDVM_Bridge
sudo cp P25Clients/MMDVM_Bridge/MMDVM_Bridge.ini /etc
sudo sed -i "s/YOURCALLSIGN/$CALLSIGN/g" /etc/MMDVM_Bridge.ini
sudo sed -i "s/YOUR_DMR_ID/$DMR_ID/g" /etc/MMDVM_Bridge.ini
sudo sed -i "s/YOUR_PASSWORD/$BM_PASSWORD/g" /etc/MMDVM_Bridge.ini

echo "Installation complete! Use the restart script to run the bridge components."

