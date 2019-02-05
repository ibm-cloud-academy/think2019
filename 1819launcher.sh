#!/bin/bash

  for i in $(seq -f "%02g" 1 20)
  do
    bash init1819c.sh cldstd$1 Think1819a! &
  done
