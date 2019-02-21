#!/usr/bin/env bash
#
# Simple script to update the DNS blocklist for pdnsd
#

# Lists to pull the hosts from
SOURCES=("http://www.malwaredomainlist.com/hostslist/hosts.txt"
         "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Dead/hosts"
	 "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"
	"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
	 "https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts"
	 "https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt"
	 "https://someonewhocares.org/hosts/hosts"
	 )

# Temporary file where the hosts are stored
TEMPFILE=/tmp/rawlist.tmp

# File where the cleaned list will be installed
TARGET=/etc/pdnsd.block

# Clean temporary download file
echo "" > $TEMPFILE

# Download and append
for src in ${SOURCES[@]}
do
	echo Downloading $src
	# remove comment lines and unneeded whitespace
	curl -s $src | sed '/^#/d;/^$/d' > $TEMPFILE 
done

echo Before dedup:
wc -l $TEMPFILE

# Remove duplicates
sort -u $TEMPFILE > $TEMPFILE.dedup

echo After dedup:
wc -l $TEMPFILE.dedup

# Install
cp $TEMPFILE.dedup $TARGET

