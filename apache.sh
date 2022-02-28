#!/bin/bash
# git install 
yum install git -y
yum update -y
yum install httpd -y 
systemctl enable httpd
systemctl start httpd