#!/bin/bash
service=heartbeat

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!" 

else
echo " Heartbeat is not running " mail -s "Heartbeat Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
systemctl start grafana-server.service | echo "Service started "  mail -s "Heartbeat Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
fi
