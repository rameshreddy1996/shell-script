#!/bin/bash
#promethues installation:
#pre-req:
#ebs to be 20gb
t2 large
#install java
amazon-linux-extras install epel -y
amazon-linux-extras install java-openjdk11 -y
amazon linux server
---------------------------------------
sudo su -
yum install wget -y

# Create a new User called prometheus.

useradd -m -s /bin/bash prometheus

# and make prometheus user as root user. 
vi /etc/sudoers
after making prometheus user as rootuser make him passwordless ------> passwd -d prometheus 

# Switch to the prometheus user and download the Prometheus software.

su - prometheus
# download package
wget https://github.com/prometheus/prometheus/releases/download/v2.19.2/prometheus-2.19.2.linux-amd64.tar.gz

# Extract the prometheus-2.19.2.linux-amd64.tar.gz file and rename the directory to 'prometheus'.

tar -xvf prometheus-2.19.2.linux-amd64.tar.gz
# delete old file copy to new file
mv prometheus-2.19.2.linux-amd64/ prometheus/

# Create a new 'data' directory that will be used as a 'tsdb' storage.

mkdir -p ~/prometheus/data

# Configure Prometheus As a Systemd Service

#Create new service file 'prometheus.service' using vi editor in  '/etc/systemd/system/' directory

sudo vi /etc/systemd/system/prometheus.service

# Paste the prometheus service configuration below.

[Unit]
Description=Prometheus Server
Documentation=https://prometheus.io/docs/introduction/overview/
After=network-online.target

[Service]
User=prometheus
Restart=on-failure

#Change this line if you download the
#Prometheus on different path user
ExecStart=/home/prometheus/prometheus/prometheus \
  --config.file=/home/prometheus/prometheus/prometheus.yml \
  --storage.tsdb.path=/home/prometheus/prometheus/data

[Install]
WantedBy=multi-user.target


# Now reload the systemd system using the systemctl command below.

 sudo systemctl daemon-reload

# enable it to launch everytime at system startup.

sudo systemctl enable prometheus
# Start the prometheus service
sudo systemctl start prometheus


systemctl status prometheus

systemctl status prometheus

# © 2022 GitHub, Inc.
# Terms
# Privacy
# Sec