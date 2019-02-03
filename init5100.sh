#!/bin/bash
  echo "Logging in as $1 with the password $2"
  ibmcloud login -u $1@us.ibm.com -p $2 -g default
  ibmcloud plugin install kubernetes-services
  ibmcloud plugin install container-registry

  ibmcloud ks cluster-create --name cloudcluster

  cnt=0
  while [ $cnt -le 1 ]
  do
    cnt=`ibmcloud ks clusters | grep normal | wc -l`
    sleep 30
  done

  `ibmcloud ks cluster-config cloudcluster | grep KUBECONFIG`
  helm init 
  helm repo add ibm-charts https://raw.githubusercontent.com/IBM/charts/master/repo/stable
  kubectl create ns istio-system
  kubectl label ns istio-system name=istio-system
  helm install ibm-charts/ibm-istio --name istio --namespace istio-system
  cd /home/localuser
  docker run --rm -v /home/localuser:/home ibmcom/istioctl:1.0.0 tar -xzvf /root/istio-1.0.0.tar.gz -C /home
  cp /home/localuser/istio-1.0.0/bin/istioctl /usr/local/bin/istioctl
  git clone https://github.com/ibm-cloud-academy/istio-yaml

  echo " Setup successful"
