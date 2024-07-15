#!/bin/sh

sed -i "s/myMailhub/$SMTPSERVER/g" /etc/ssmtp/ssmtp.conf
sed -i "s/myHostname/$(hostname)/g" /etc/ssmtp/ssmtp.conf
sed -i "s/UseSTARTTLS=YES/UseSTARTTLS=$UseSTARTTLS/g" /etc/ssmtp/ssmtp.conf
echo "root:$FROM:$SMTPSERVER" >> /etc/ssmtp/revaliases
echo "monitoring:$FROM:$SMTPSERVER" >> /etc/ssmtp/revaliases

crontab -l | { cat; echo "*/1 * * * * /monitoring/monitoring.sh $REMOTE_HOST $SMTPSERVER $FROM $TO $USER $PASSWORD &> /var/log/monitoring/monitoring.log"; } | crontab -

crond -f