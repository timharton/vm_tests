#!/bin/bash

# This file creates a 500 mb file then removes it 
LOCATION=/run/media/admin/test_drive/test_file
LOCATION2=/run/media/admin/test_drive/test_file2
while true; do
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 500" >> test_drive_`date -I`.csv
    echo "Creating 500Mb file: $LOCATION2"
    cat $LOCATION > $LOCATION2
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 500" >> test_drive_`date -I`.csv
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> test_drive_`date -I`.csv
    echo "Removing file: $LOCATION2"
    rm -f $LOCATION2
    sleep 5m
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> test_drive_`date -I`.csv
done
