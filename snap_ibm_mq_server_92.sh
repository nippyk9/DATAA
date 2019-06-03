#!/bin/bash
SNAPSHOT=`date +%Y%m%d-%H%M%S`

curl -X PUT "10.100.76.90:9200/_snapshot/es-backup/ibm_mq_server_92.$SNAPSHOT?wait_for_completion=true" -H 'Content-Type: application/json' -d'
{
  "indices": "ibm_mq_server_92-*,
  "ignore_unavailable": true,
  "include_global_state": false
}
'

