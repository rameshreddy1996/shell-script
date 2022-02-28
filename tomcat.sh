#!/bin/bash
# install the java
sudo amazon-linux-extras install epel -y 
sudo amazon-linux-extras install java-openjdk11 -y
# install the tomcat
cd /opt/
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58-windows-x64.zip
# extract 
sudo unzip apache-tomcat-9.0.58-windows-x64.zip
# delete the zip
sudo rm -f apache-tomcat-9.0.58-windows-x64.zip
sudo mv apache-tomcat* tomcat
sudo chmod -R 755 /opt/tomcat/
#start the tomact
sudo sh /opt/tomcat/bin/startup.sh 
# stop the tomact
# sudo sh /opt/tomcat/bin/shutdown.sh
# when youn install server how to check
# ps -ef | grep tomcat
# port listen or not
# netstat -anlp | grep "8080"