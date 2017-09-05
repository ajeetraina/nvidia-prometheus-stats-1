#!/bin/bash

#Stopping all running containers
sudo docker stop $(sudo docker ps -a -q)

#Starting Pushgateway
sudo docker run -d -p 94.130.33.61:9091:9091 prom/pushgateway

# Starting Prometheus
sudo docker run -d -p 94.130.33.61:9090:9090 -v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml prom
/prometheus -config.file=/etc/prometheus/prometheus.yml -storage.local.path=/prometheus

# Starting Grafana
sudo docker run -d --name=grafana -p 94.130.33.61:3000:3000 grafana/grafana
