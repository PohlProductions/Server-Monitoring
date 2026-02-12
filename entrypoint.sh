#!/bin/sh

FLAG_FILE="/monitoring/.setup_successful"

if [ ! -f "$FLAG_FILE" ]; then
    crontab -l | { cat; echo "*/15 * * * * /monitoring/monitoring.sh $REMOTE_HOST $ACCESS_TOKEN $HOSTNAME $MASTODON_HANDLE>> /var/log/monitoring/monitoring.log"; } | crontab -

    touch "$FLAG_FILE"
fi

crond -f

