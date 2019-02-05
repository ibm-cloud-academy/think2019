#!/bin/bash

  for i in $(seq -f "%02g" 21 40)
  do
    bash init1819c.sh cldstd$1 Think1819b! &
  done
