#!/bin/bash

if [ -z "$1" ]
    then
        SEARCH_DIR=$(pwd) 
    else
        SEARCH_DIR=$1
fi

if [ -z "$2" ]
    then
        out_file="ecostress_datelist.csv"
    else
        out_file=$2
fi

echo "Date/Time of ECOSTRESS observations in $SEARCH_DIR" >> $out_file
echo "file, day, month, year, time" >> $out_file
for f in "$SEARCH_DIR"*.tif; do
    filename=$(echo $f | rev | cut -d'/' -f 1 | rev)
    datetime_regex="_([0-9]{8}T[0-9]{6})_"
    if [[ $f =~ $datetime_regex ]]; then
        datetime=${BASH_REMATCH[1]}; fi
    YEAR=$(echo $datetime | cut -c1-4)
    MONTH=$(echo $datetime | cut -c5-6) 
    DAY=$(echo $datetime | cut -c7-8) 
    HR=$(echo $datetime | cut -c10-11)
    MIN=$(echo $datetime | cut -c12-13)
    SEC=$(echo $datetime | cut -c14-15)
    echo "${filename}, ${DAY}, ${MONTH}, ${YEAR},  ${HR}:${MIN}:${SEC}" >> $out_file
done
