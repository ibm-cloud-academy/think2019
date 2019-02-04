#!/bin/bash
  ibmcloud config --check-version=false
  ibmcloud plugin install kubernetes-service
  ibmcloud plugin install container-registry

  cd /home/localuser
  docker run --rm -v /home/localuser:/home ibmcom/istioctl:1.0.0 tar -xzvf /root/istio-1.0.0.tar.gz -C /home
  echo passw0rd | sudo -S cp /home/localuser/istio-1.0.0/bin/istioctl /usr/local/bin/istioctl
  git clone https://github.com/ibm-cloud-academy/istio-yaml

