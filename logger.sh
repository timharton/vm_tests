#!/bin/bash


while true; do
	iostat -d -t -x -p >> ~/`date -I`.io
	sleep 5
done
