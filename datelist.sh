#!/bin/bash

for f in *; do
    YEAR=$(echo $f | cut -d'_' -f6 | cut -c1-4)
    MONTH=$(echo $f | cut -d'_' -f6 | cut -c5-6) 
    DAY=$(echo $f | cut -d'_' -f6 | cut -c7-8) 
    HR=$(echo $f| cut -d'_' -f6 | cut -c10-11)
    MIN=$(echo $f | cut -d'_' -f6 | cut -c12-13)
    SEC=$(echo $f | cut -d'_' -f6 | cut -c14-15)
    echo "${DAY} ${MONTH} ${YEAR}  ${HR}:${MIN}:${SEC}"
done
