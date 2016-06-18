#!/bin/bash

cd
wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
sudo mv eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz /data/apps/
cd /data/apps
sudo tar xzf eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
sudo chown centos:centos eclipse -R
sudo ln -s /data/apps/eclipse/eclipse /usr/bin/eclipse








