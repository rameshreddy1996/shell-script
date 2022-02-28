#!/bin/bash
# Amazon Linux 
#t2.micro
# port number -- 3000


sudo su -
sudo yum update -y
sudo nano /etc/yum.repos.d/grafana.repo  
#---> Add the lines below
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

# to save use---> 
ctrl+s
#and to exit from text editor use--> press
ctrl+x
       
sudo yum install grafana
 
sudo systemctl daemon-reload

sudo systemctl start grafana-server

sudo systemctl status grafana-server

sudo systemctl enable grafana-server.service