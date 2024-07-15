#!/bin/sh

remotehost=$1
SMTPSERVER=$2
FROM=$3
TO=$4
USER=$5
PASSWORD=$6

touch /monitoring/tmp/msg.txt
echo -e "Subject: Server not reachable\n\nServer: $remotehost\nTime: $(date)" > /monitoring/tmp/msg.txt


if ping -c 1 -w 1 $remotehost > /dev/null
then
  echo "$(date) success"
else
  sendmail -v -S$SMTPSERVER -f$FROM -au$USER -ap$PASSWORD $TO < /monitoring/tmp/msg.txt 2>&1
  echo "$(date) failed"
fi