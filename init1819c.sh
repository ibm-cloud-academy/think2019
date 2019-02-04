#!/bin/bash
  echo "Logging in as $1 with the password $2"
  ibmcloud config --check-version=false
  echo 1 | ibmcloud login -a https://api.ng.bluemix.net -u $1@us.ibm.com -p $2 -g default
  ibmcloud cr namespace-add "$1"usibmcom

  ibmcloud ks cluster-create --name cloudcluster

  cnt=0
  while [ $cnt -lt 1 ]
  do
    cnt=`ibmcloud ks clusters | grep normal | wc -l`
    sleep 30
  done
  echo "Cluster created - setup successful"
