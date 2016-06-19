#!/bin/bash

cd
echo "[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc" | sudo tee -a /etc/yum.repos.d/mongodb-org-3.2.repo
sudo yum install -y mongodb-org-3.2.7 mongodb-org-server-3.2.7 mongodb-org-shell-3.2.7 mongodb-org-mongos-3.2.7 mongodb-org-tools-3.2.7

echo "# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#	enforcing - SELinux security policy is enforced.
#	permissive - SELinux prints warnings instead of enforcing.
#	disabled - SELinux is fully disabled.
SELINUX=permissive
# SELINUXTYPE= type of policy in use. Possible values are:
#	targeted - Only targeted network daemons are protected.
#	strict - Full SELinux protection.
SELINUXTYPE=targeted" | sudo tee /etc/selinux/config
sudo mkdir /data/store/logs
sudo touch /data/store/logs/mongo.log
sudo mkdir -p /data/store/data/db
sudo chmod 666 /data -R
sudo chown mongod:mongod /data/store -R
echo "# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /data/store/logs/mongo.log

# Where and how to store data.
storage:
  dbPath: /data/store/data/db
  journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1  # Listen to local interface only, comment to listen on all interfaces.


#security:

#operationProfiling:

#replication:

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:" | sudo tee /etc/mongod.conf

echo "centos soft nofile 64000
centos hard nofile 64000
mongod soft nofile 64000
mongod hard nofile 64000
mongod soft nproc 32000" | sudo tee /etc/security/limits.conf
echo "fs.file-max = 100000" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sudo service mongod start





