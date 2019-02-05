#!/bin/bash
  echo "Logging in as $1 with the password $2"
  ibmcloud config --check-version=false
  echo 1 | ibmcloud login -a https://api.ng.bluemix.net -u $1@us.ibm.com -p $2 -g default

  exist=`ibmcloud cr namespaces | grep "$1"usibmcom | wc -l`
  if [ $exist -lt 1 ]
  then 
    ibmcloud cr namespace-add "$1"usibmcom
  fi

  ibmcloud ks cluster-create --name cloudcluster

  cnt=0
  while [ $cnt -lt 1 ]
  do
    cnt=`ibmcloud ks clusters | grep normal | wc -l`
    sleep 30
  done
  echo "Cluster created $1 - setup successful"
