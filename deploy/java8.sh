#!/bin/bash

cd /data/apps
sudo  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz"
sudo tar xzf jdk-8u92-linux-x64.tar.gz
sudo rm jdk-8u92-linux-x64.tar.gz
cd /data/apps/jdk1.8.0_92/
sudo alternatives --install /usr/bin/java java /data/apps/jdk1.8.0_92/bin/java 2
sudo alternatives --config java
sudo alternatives --install /usr/bin/jar jar /data/apps/jdk1.8.0_92/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /data/apps/jdk1.8.0_92/bin/javac 2
sudo alternatives --set jar /data/apps/jdk1.8.0_92/bin/jar
sudo alternatives --set javac /data/apps/jdk1.8.0_92/bin/javac
export JAVA_HOME=/data/apps/jdk1.8.0_92
export JRE_HOME=/data/apps/jdk1.8.0_92/jre
export PATH=$PATH:/data/apps/jdk1.8.0_92/bin:/data/apps/jdk1.8.0_92/jre/bin

echo "export JAVA_HOME=/data/apps/jdk1.8.0_92
export JRE_HOME=/data/apps/jdk1.8.0_92/jre
export PATH=$PATH:/data/apps/jdk1.8.0_92/bin:/data/apps/jdk1.8.0_92/jre/bin" | sudo tee -a /etc/environment





