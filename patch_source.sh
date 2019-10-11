#!/bin/bash

#Creating directories 
mkdir -p ./changes/openmme/src/mme-app/handlers/;
mkdir -p ./changes/openmme/src/mme-app/sec/;
mkdir -p ./changes/openmme/src/s6a/handlers/;
mkdir -p ./changes/openmme/src/s11/handlers/;
mkdir -p ./changes/openmme/src/s1ap/handlers/;
mkdir -p ./changes/openmme/src/common/;
for file in `find . -name *.c|xargs grep -l "func_msg" .`; 
do 
  destination=`echo -n $file | sed 's/^.//'`
  cp "$file" "./changes$destination"; 
done
