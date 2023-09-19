# Mentoria-CanalCloud3.0
 
 Commandos install prometheus e grafana

# instalar prometheus

sudo apt-get update
sudo apt-get install prometheus -y
netstat -atunp | grep 9090

nano /etc/prometheus/prometheus.yml


# instalando o grafana

sudo apt-get install -y apt-transport-https

sudo apt-get install -y software-properties-common wget

wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

echo "deb https://packages.grafana.com/enterprise/deb beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

sudo apt-get update

sudo apt-get install grafana-enterprise -y


systemctl start grafana-server
systemctl status grafana-server

netstat -atunp | grep 3000