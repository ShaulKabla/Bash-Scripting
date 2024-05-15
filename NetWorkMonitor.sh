#!/bin/bash

HOST="8.8.8.8"

MAX_FAILED_PING=5

failed_pings=0

alert_system_down() {
    recipient="shaulserver@gmail.com"
    subject="Alert: Server-Ping-Down!"
    body="Check Ping, Can't reach Google."

    # Send the email
    echo "$body" | mail -s "$subject" "$recipient"
}


while true; do
    ping -c 1 $HOST >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        failed_pings=0
    else
        failed_pings+=1
    fi

    if [ $MAX_FAILED_PING == $faild_pings ]; then
    echo "Host Down!"
    alert_system_down
    break
    fi

    sleep 2
done


