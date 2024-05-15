#!/bin/bash

# CronJob syntax

# The first * means "every minute" (0-59).
# The second * means "every hour" (0-23).
# The third * means "every day of the month" (1-31).
# The fourth * means "every month" (1-12).
# The fifth * means "every day of the week" (0-7, where 0 and 7 represent Sunday).

while true; do

    echo "0 3 * * * ~/Desktop/monitorscripts/backup_script.sh" >> ~/.my_scheduled_tasks # Runing backup task at 3 AM

    echo "*/15 * * * * ~/Desktop/monitorscripts/system_monitor.sh" >> ~/.my_scheduled_tasks # Runing system_monitor every 15 min

    echo "0 7 * * * ~/Desktop/monitorscripts/autoupdate.sh" >> ~/.my_scheduled_tasks # Runing updates of the system every day in 7 AM

    echo "0 8 * * * ~/Desktop/monitorscripts/file_organizer.sh" >> ~/.my_scheduled_tasks # Runing orginzed files script every day at 8 AM

    echo "*/15 * * * * ~/Desktop/monitorscripts/network_monitor.sh" >> ~/.my_scheduled_tasks

    crontab ~/.my_scheduled_tasks

    echo "Task scheduling completed."
done

    
