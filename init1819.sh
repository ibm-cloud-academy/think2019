#!/bin/bash
  echo "Logging in as $1 with the password $2"
  ibmcloud login -u $1@us.ibm.com -p $2 -g default
  ibmcloud plugin install kubernetes-services
  ibmcloud plugin install container-registry
  ibmcloud cr namespace-add "$1"usibmcom

  ibmcloud ks cluster-create --name cloudcluster

  cnt=0
  while [ $cnt -le 1 ]
  do
    cnt=`ibmcloud ks clusters | grep normal | wc -l`
    sleep 30
  done
  echo "Cluster created - setup successful"
