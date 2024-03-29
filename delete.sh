#!/bin/bash
#
# Clean up script for old elasticsearch snapshots.
# 23/2/2014 karel@narfum.eu
#
# You need the jq binary:
# - yum install jq
# - apt-get install jq
# - or download from http://stedolan.github.io/jq/

# The amount of snapshots we want to keep.
LIMIT=2

# Name of our snapshot repository
REPO=all_uat.backup

# Get a list of snapshots that we want to delete
SNAPSHOTS=`curl -s -XGET "10.11.19.188:9200/_snapshot/$REPO/_all" \
  | jq -r ".snapshots[:-${LIMIT}][].snapshot"`

# Loop over the results and delete each snapshot
for SNAPSHOT in $SNAPSHOTS
do
 echo "Deleting snapshot: $SNAPSHOT"
 curl -s -XDELETE "10.100.76.90:9200/_snapshot/$REPO/$SNAPSHOT?pretty"
done
echo "Done!"

