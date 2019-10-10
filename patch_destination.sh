#!/bin/bash
for file in `find ./changes/ -name *.c`;
do
  destination=`echo -n $file | sed 's/^.\/changes//'`
  echo "$file" ".$destination";
done
