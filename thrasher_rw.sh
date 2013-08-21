#!/bin/bash

# Thrashes with both reads and writes utilising cat

# Author: Tim Harton, tima@harton.co
# Date: 2013-08-21

# This file creates a 500 mb file then removes it 
# LOCATION, file name and location to test
# FILE_SIZE, to thrash in MB
# SLEEP_PERIOD e.g. 5m = 5 minutes, 5 = 5 seconds

LOCATION=test_file
FILE_SIZE=500
SLEEP_PERIOD=1m

# Do not change anything past this point

echo "Setting up: $LOCATION"

# Create null file to copy from
dd if=/dev/zero of=$LOCATION bs=1M count=$FILE_SIZE;
# Location to copy to
STR=_cat
LOCATION2=$LOCATION$STR

mkdir -p rw_logs
while true; do
    CSV_FILE="rw_logs/`date -I`.csv"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> "$CSV_FILE"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, $FILE_SIZE" >> "$CSV_FILE"
    echo "Creating $FILE_SIZE Mb file: $LOCATION2"
    cat $LOCATION > $LOCATION2
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, $FILE_SIZE" >> "$CSV_FILE"
    echo "`date +"%Y-%m-%e %k:%M:%S.%N"`, 0" >> "$CSV_FILE"
    echo "Removing file: $LOCATION2"
    rm -f $LOCATION2
    echo "Sleeping for: $SLEEP_PERIOD"
    sleep $SLEEP_PERIOD
done
