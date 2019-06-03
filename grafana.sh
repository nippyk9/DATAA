#!/bin/bash
service=grafana-server.service

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!" 

else
echo "$service is not running "| mail -s "$service  Status " -r elk_mon_alert@aimsoftware.com  nirpendra.kumar@aimsoftware.com
systemctl start $service | echo "Service started" | mail -s "$service Status " -r elk_mon_alert@aimsoftware.com  nirpendra.kumar@aimsoftware.com
fi
