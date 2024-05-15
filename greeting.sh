#!/bin/bash

username=$(hostname)
hour=$(date +%H)

if [ $hour -lt 12 ]; then
    echo "Good Morning, $username"
elif [ $hour -lt 18 ]; then 
    echo "Good afternoon, $username"
else
    echo "Good evening, $username"
fi
