#!/bin/bash

if [ -z "$1" ]
    then
        SEARCH_DIR=$(pwd) 
    else
        SEARCH_DIR=$1
fi

echo "Date/Time of ECOSTRESS observations in $SEARCH_DIR" >> ecostress_datelist.csv
echo "file, day, month, year, time" >> ecostress_datelist.csv
for f in "$SEARCH_DIR"/*.tif; do
    YEAR=$(echo $f | cut -d'_' -f6 | cut -c1-4)
    MONTH=$(echo $f | cut -d'_' -f6 | cut -c5-6) 
    DAY=$(echo $f | cut -d'_' -f6 | cut -c7-8) 
    HR=$(echo $f| cut -d'_' -f6 | cut -c10-11)
    MIN=$(echo $f | cut -d'_' -f6 | cut -c12-13)
    SEC=$(echo $f | cut -d'_' -f6 | cut -c14-15)
    echo "${f}, ${DAY}, ${MONTH}, ${YEAR},  ${HR}:${MIN}:${SEC}" >> ecostress_datelist.csv
done
