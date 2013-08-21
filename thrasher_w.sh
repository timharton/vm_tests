#!/bin/bash

# Thashes with writing to disk only

# Author: Tim Harton, tim@harton.co
# Date: 2013-08-21

# This file creates a 500 mb file then removes it 
# LOCATION, file name and location to test
# FILE_SIZE, to thrash in MB
# SLEEP_PERIOD e.g. 5m = 5 minutes, 5 = 5 seconds

LOCATION=test_file
FILE_SIZE=500
SLEEP_PERIOD=1m

# Do not change anything past this point

mkdir -p w_logs
while true; do
    CSV_FILE="w_logs/`date -I`.csv"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> "$CSV_FILE"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, $FILE_SIZE" >> "$CSV_FILE"
    echo "Creating $FILE_SIZE Mb file: $LOCATION2"
    dd if=/dev/zero of=$LOCATION bs=1M count=$FILE_SIZE;
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, $FILE_SIZE" >> "$CSV_FILE"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> "$CSV_FILE"
    echo "Removing file: $LOCATION2"
    rm -f $LOCATION2
    echo "Sleeping for: $SLEEP_PERIOD"
    sleep $SLEEP_PERIOD
done
