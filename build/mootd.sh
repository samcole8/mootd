#!/bin/sh

# Select cow with 10% chance of being atypical
cow=$((0 + $RANDOM % 10))
if [ $cow != 1 ]; then
	# Use default cow
	motd=$(fortune | cowsay)
else
	# Use random cow from /usr/share/cows/
	random_cow=$(ls /usr/share/cows/ | shuf -n1)
	motd=$(fortune | cowsay -f "/usr/share/cows/$random_cow")
fi

# Write motd
echo "$motd" > /srv/www/index.html
