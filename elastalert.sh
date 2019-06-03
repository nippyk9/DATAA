#!/bin/bash
service=elastalert

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!" 

else
echo "$service  is not running " mail -s "$service Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
cd /opt/elastalert/elastalert 
nohup elastalert --verbose & >/dev/null   | echo "$service Service started " | mail -s "$service Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
fi
