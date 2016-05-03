#!/bin/bash

pastd=`date -u +%Y/%m/%d -d "1 day ago"`
outputd=`date -u +%Y%m%d -d "1 day ago"`

if [ -f /tmp/internal-active.set ]; then
    rm /tmp/internal-active.set
fi

/usr/local/bin/rwfilter --start-date=$pastd --type=out,outweb --all-dest=stdout | /usr/local/bin/rwset --sip=/tmp/internal-active.set

/usr/local/bin/rwfilter --start-date=$pastd --type=in,inweb --all-dest=stdout | /usr/local/bin/rwsort --fields=sip,proto,dip | /usr/local/bin/rwscan --trw-internal-set=/tmp/internal-active.set --scan-model=0 --output-path=$HOME/scan_detection/scan_logs/${outputd}_scan0.txt

#/usr/local/bin/rwsiteinfo --fields=sensor >> $HOME/scan_detection/${this1h}_scan0.txt
