#!/bin/bash
PORT=9200
URL="http://10.100.76.90:$PORT"
curl -s $URL 2>&1 > /dev/null
if [ $? != 0 ]; then
    echo "Elasticsearch is not working on 10.100.76.90 pls check ASAP" | mail -s "Elasticsearch Status " -r elk_mon_alert@aimsoftware.com  elk_mon_alert@aimsoftware.com nirmal.kumar@aimsoftware.com
    exit -1
fi
