#!/bin/sh

crontab -l | { cat; echo "*/15 * * * * /monitoring/monitoring.sh $REMOTE_HOST $ACCESS_TOKEN $HOSTNAME $MASTODON_HANDLE>> /var/log/monitoring/monitoring.log"; } | crontab -

crond -f