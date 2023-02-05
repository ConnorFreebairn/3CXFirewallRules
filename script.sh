#!/bin/bash

# Author: Connor Freebairn
# Description: A bash script to add multiple firewall rules using the iptables firewall
# Date: 05-02-2023

# To run the script execute the following commnads when logged in as root
# wget https://raw.githubusercontent.com/ConnorFreebairn/3CXFirewallRules/main/script.sh
# chmod +x script.sh
# ./script.sh 192.168.1.1 192.168.1.2

# Flush existing iptables rules
sudo iptables -F

# Add iptables rule for incoming TCP traffic on port 443
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
echo "iptables rule added for inbound port 443"

# Add iptables rule for incoming TCP traffic on port 5001
sudo iptables -A INPUT -p tcp --dport 5001 -j ACCEPT
echo "iptables rule added for inbound port 5001"

# Add iptables rule for incoming TCP traffic on port 5060
sudo iptables -A INPUT -p tcp --dport 5060 -j ACCEPT
echo "iptables rule added for inbound port 5060"

# Add iptables rule for incoming TCP traffic on port 5061
sudo iptables -A INPUT -p tcp --dport 5061 -j ACCEPT
echo "iptables rule added for inbound port 5061"

# Add iptables rule for incoming TCP traffic on port 5062
sudo iptables -A INPUT -p tcp --dport 5062 -j ACCEPT
echo "iptables rule added for inbound port 5062"

# Add iptables rule for incoming TCP traffic on port 5090
sudo iptables -A INPUT -p tcp --dport 5090 -j ACCEPT
echo "iptables rule added for inbound port 5090"

# Add iptables rule for incoming UDP traffic on port 5060
sudo iptables -A INPUT -p udp --dport 5060 -j ACCEPT
echo "iptables rule added for inbound port 5060"

# Add iptables rule for incoming UDP traffic on port 5090
sudo iptables -A INPUT -p udp --dport 5090 -j ACCEPT
echo "iptables rule added for inbound port 5090"

# Add iptables rule for incoming UDP traffic on ports 9000 to 10999
sudo iptables -A INPUT -p udp --dport 9000:10999 -j ACCEPT
echo "iptables rule added for inbound UDP traffic on ports 9000 to 10999"

# Allow incoming SSH traffic on port 22 from specific IP address provided at runtime
sudo iptables -A INPUT -p tcp -s $1 --dport 22 -j ACCEPT
echo "iptables rule added to allow incoming SSH traffic on port 22 from IP address provided at runtime"

# Allow incoming SSH traffic on port 22 from specific IP address provided at runtime
sudo iptables -A INPUT -p tcp -s $2 --dport 22 -j ACCEPT
echo "iptables rule added to allow incoming SSH traffic on port 22 from IP address provided at runtime"

# Allow all outbound traffic
sudo iptables -A OUTPUT -p tcp -j ACCEPT
sudo iptables -A OUTPUT -p udp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT
echo "iptables rule added for all outbound traffic"

# Enable iptables rules
sudo iptables-save
echo "iptables rules saved"
