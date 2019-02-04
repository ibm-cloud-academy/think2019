#!/bin/bash
  echo "Logging in as $1 with the password $2"
  ibmcloud config --check-version=false
  echo 1 | ibmcloud login -a https://api.ng.bluemix.net -u $1@us.ibm.com -p $2 -g default

  ibmcloud ks cluster-create --name cloudcluster

  cnt=0
  while [ $cnt -lt 1 ]
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

  echo " Setup successful"
