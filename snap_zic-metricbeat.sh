#!/bin/bash
SNAPSHOT=`date +%Y%m%d-%H%M%S`

curl -X PUT "10.100.76.90:9200/_snapshot/es-backup/zic-metricbeat.$SNAPSHOT?wait_for_completion=true" -H 'Content-Type: application/json' -d'
{
  "indices": "zic-metricbeat-*,
  "ignore_unavailable": true,
  "include_global_state": false
}
'

