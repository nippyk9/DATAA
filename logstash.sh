#!/bin/bash
service=logstash

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!" 

else
echo " $service is not running " mail -s "$service Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
systemctl start logstash.service | echo "$service Service started "  mail -s "$service Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com
fi
