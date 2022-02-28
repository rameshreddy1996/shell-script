#!/bin/bash
# sonarqube installation on amazon linux
# pre-req
# 1.An EC2 instance with a minimum of 2 GB RAM (t2.mediam)
#sg--> 22 anywhere, 9000 anywhere
# 2.Java 11 installation
# 3.SonarQube cannot be run as root on Unix-based systems, so create a dedicated user account for SonarQube if necessary. 
#updating system packages
sudo yum update -y
#install epel
sudo amazon-linux-extras install epel
#installing Java
sudo amazon-linux-extras install java-openjdk11 -y
#switch to root user
sudo su -
#change the directory to optional folder
cd /opt/
#download the sonarqube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.7.52159.zip
#unzip the zip file
unzip sonarqube-8.9.7.52159.zip
#create a user
useradd sonaradmin
#Change the ownership to the user
chown sonaradmin:sonaradmin sonarqube-8.9.7.52159
#permission
chmod -R 777 /opt/sonarqube-8.9.7.52159/
#switch user
su - sonaradmin
#Start service
sh /opt/sonarqube-8.9.7.52159/bin/linux-x86-64/sonar.sh start
#Status check
sh /opt/sonarqube-8.9.7.52159/bin/linux-x86-64/sonar.sh status