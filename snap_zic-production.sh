#!/bin/bash
SNAPSHOT=`date +%Y%m%d-%H%M%S`
#curl -XPUT "10.100.76.90:9200/_snapshot/all_uat.backup/all_uat.$SNAPSHOT?wait_for_completion=true { "indices": "all_uat-*"}"





#PUT /_snapshot/my_backup/bcp?wait_for_completion=true
#{
#"indices":"filebeat-*"
#}



curl -X PUT "10.100.76.90:9200/_snapshot/zic-prod/zic-production1.$SNAPSHOT?wait_for_completion=true" -H 'Content-Type: application/json' -d'
{
  "indices": "zic-production1-*",
  "ignore_unavailable": true,
  "include_global_state": false
}
'

