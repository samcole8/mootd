#!/bin/sh

# Generate MOTD if container is new
if test -f /root/new; then
	/root/mootd.sh
	rm /root/new
fi

# Start cron daemon
crond start

# Start nginx
exec nginx -g "daemon off;"
