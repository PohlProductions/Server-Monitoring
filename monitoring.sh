#!/bin/sh

remotehost=$1
msg="Server: ".$1"\nTime: $(date)"

if ping -c 1 -w 1 $remotehost > /dev/null
then
  echo "$(date) success"
else
  echo $msg | mail  -s "Server Down" $TO
  echo "$(date) failed"
fi