#!/bin/bash

echo passw0rd | sudo -S apt-get update && sudo apt-get upgrade
echo passw0rd | sudo -S apt-get install default-jdk

cat <<EOF >> /etc/profile
export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
EOF
