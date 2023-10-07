#!/bin/bash
sudo su
apt-get update -y
apt-get upgrade -y
apt-get install wget -y
apt-get install -y tar
apt-get install default-jdk -y
wget https://github.com/keycloak/keycloak/releases/download/15.0.2/keycloak-15.0.2.tar.gz
tar -xvzf keycloak-15.0.2.tar.gz
mv keycloak-15.0.2 /opt/keycloak
groupadd keycloak
useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak
chown -R keycloak: /opt/keycloak
chmod o+x /opt/keycloak/bin/
mkdir /etc/keycloak
cp /opt/keycloak/docs/contrib/scripts/systemd/wildfly.conf /etc/keycloak/keycloak.conf
cp /opt/keycloak/docs/contrib/scripts/systemd/launch.sh /opt/keycloak/bin/
chown keycloak: /opt/keycloak/bin/launch.sh