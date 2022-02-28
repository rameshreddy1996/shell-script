#pwd
 /opt
 cd /opt
#!/bin/bash
# install git
sudo yum install git -y
# Download maven
cd /opt/
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
# extract
sudo tar -xvzf apache-maven-3.8.4-bin.tar.gz
# rename
sudo mv apache-maven-3.8.4 maven
# remove gz
sudo rm -f apache-maven-3.8.4-bin.tar.gz
#check maven
cd opt/maven/bin/mvn/mvn
./mvn