#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y openjdk-11-jre wget
sudo wget https://downloads.jboss.org/keycloak/15.0.2/keycloak-15.0.2.tar.gz
sudo tar -xzf keycloak-15.0.2.tar.gz
sudo mv keycloak-15.0.2 /opt/keycloak
sudo groupadd keycloak
sudo /opt/keycloak/bin/add-user-keycloak.sh -u admin -p admin
sudo nohup /opt/keycloak/bin/standalone.sh -b 0.0.0.0 &
#install ansible
sudo apt install ansible -y
sudo apt-get install python -y