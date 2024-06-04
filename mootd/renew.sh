#!/bin/sh

# Chance reciprocal for cow being non-standard
# e.g., if CHANCE=100 then 1/100 chance of atypical cow
chance=10

# RNG for cow chance
cow=$((1 + $RANDOM % $chance))
if [ $cow != 1 ]; then
	# Use default cow
	motd=$(fortune | cowsay)
else
	# Use random cow from /usr/share/cows/
	random_cow=$(ls /usr/share/cows/ | shuf -n1)
	motd=$(fortune | cowsay -f "/usr/share/cows/$random_cow")
fi

# Write motd
echo "$motd" > mootd
