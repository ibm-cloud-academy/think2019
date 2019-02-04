#!/bin/bash
  ibmcloud config --check-version=false
  ibmcloud plugin install kubernetes-service
  ibmcloud plugin install container-registry
