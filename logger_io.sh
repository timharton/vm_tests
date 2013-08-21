#!/bin/bash

# Author: Tim Harton, tim@harton.co
# Date: 2013-08-21

# SLEEP_PERIOD, e.g 10 = 10 seconds and 10m = 10 minutes
SLEEP_PERIOD=10

mkdir -p io_logs

while true; do
	LOG_FILE="io_logs/`date -I`.io"
    iostat -d -t -x -p >> "$LOG_FILE" 
	sleep $SLEEP_PERIOD 
done
