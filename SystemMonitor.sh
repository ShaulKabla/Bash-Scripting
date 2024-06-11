#!/bin/bash

# awk - scripting language to manipulate text
# %.2f = 2 decimal numbers after the point
# %% = showing the % symbol
# /t = New Tab
# Can adding log file, handle error func 


# Function for monitor memory

monitor_mem() {
    memUsage=$(free -m | awk '/Mem/{printf $3}') #"/Mem" - Showing the result of Mem line with place holder var (3) for the place I reading the line
    memUsage_precent=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
    echo "System using $memUsage MB that is $memUsage_precent"
    }

# Function for monitor disk space
monitor_disk() {
    diskUsage_used=$(df -h | awk '$NF=="/"{printf "%s\t\t", $3}')
    diskUsage_size=$(df -h | awk '$NF=="/"{printf "%s\t\t", $2}')
    diskUsage_precent=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
    echo "System using $diskUsage_used from disk size $diskUsage_size that is $diskUsage_precent"
}

# Function for monitor CPU usage
monitor_cpu() {
    cpu_Usage=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
    echo "System current CPU usage is $cpu_Usage"
}

# Function to send the info via mail
# Gmail requires SPF and DKIM recored for sending emails.
# 

send_email() {
    recipient=""
    subject="System Monitoring Report"
    sender=""
    monitoring_info=$(echo -e "System Monitoring Report:\n$(monitor_mem)\n$(monitor_disk)\n$(monitor_cpu)")
    echo -e "$monitoring_info" | mail -s "$subject" -r "$sender" "$recipient"
}

# Runing the script with while loop every hour.

main() {
    while true; do
        send_email
        sleep 3600  # 1 Hour
    done
}

main

