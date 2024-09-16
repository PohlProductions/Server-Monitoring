#!/bin/sh

target=$1

success_count=0

# Ping the remote host 5 times
for i in $(seq 1 5)
do
  if ping -c 1 -w 1 $target > /dev/null
  then
    success_count=$((success_count + 1))
  fi
done

# Perform actions based on the number of successful pings
if [ $success_count -gt 3 ]
then
  echo "$(date) success"
else

  access_token=$2
  hostname=$3
  mastodonhandle=$4

  msg="Server not reachable Server: $hostname cannot reach $target Time: $(date)"

  curl -X POST -H "Authorization: Bearer $access_token" -F "status=$msg $mastodonhandle" -F "visibility=direct" https://mastodon.social/api/v1/statuses
  echo "$(date) failed"
fi