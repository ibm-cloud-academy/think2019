#!/bin/bash
  echo passw0rd | sudo -S  mv cloudctl-linux-amd64 /usr/local/bin/cloudctl
  cloudctl login -a https://10.10.1.10:8443 -u admin -p passw0rd -n default -c id-cloudcluster-account  --skip-ssl-validation
  helm init --client-only
  helm repo add ibm-charts https://raw.githubusercontent.com/IBM/charts/master/repo/stable
  kubectl create ns istio-system
  kubectl label ns istio-system name=istio-system
  helm install ibm-charts/ibm-istio --name istio --namespace istio-system --tls --set tracing.enabled=true --set grafana.enabled=true --set pilot.resource.request.cpu=100m --set pilot.resource.request.memory=1024Mi
  cd /home/localuser
  docker run --rm -v /home/localuser:/home ibmcom/istioctl:1.0.0 tar -xzvf /root/istio-1.0.0.tar.gz -C /home
  echo passw0rd | sudo -S  cp /home/localuser/istio-1.0.0/bin/istioctl /usr/local/bin/istioctl
  git clone https://github.com/ibm-cloud-academy/istio-yaml

