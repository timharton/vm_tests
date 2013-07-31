#!/bin/bash

# This file creates a 1 gig file then removes it 
LOCATION=/tmp/output

while true; do
    echo "Creating 1Gb file: $LOCATION"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 1000" >> ~/main_drive_`date -I`.csv
    dd if=/dev/zero of=$LOCATION bs=1M count=1000; 
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 1000" >> ~/main_drive_`date -I`.csv
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> ~/main_drive_`date -I`.csv
    echo "Removing file: $LOCATION"
    rm -f $LOCATION
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> ~/main_drive_`date -I`.csv
done
