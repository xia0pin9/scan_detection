#!/bin/bash

cur1h=`date -u +%Y/%m/%d:%H -d "1 hour ago"`
past6h=`date -u +%Y/%m/%d:%H -d "6 hour ago"`
this1h=`date -u +%Y%m%d%H -d "1 hour ago"`

if [ -f /tmp/internal-active.set ]; then
    rm /tmp/internal-active.set
fi

/usr/local/bin/rwfilter --start-date=$past6h --end-date=$cur1h --type=out,outweb --all-dest=stdout | /usr/local/bin/rwset --sip=/tmp/internal-active.set

/usr/local/bin/rwfilter --start-date=$cur1h --type=in,inweb --all-dest=stdout | /usr/local/bin/rwsort --fields=sip,proto,dip | /usr/local/bin/rwscan --trw-internal-set=/tmp/internal-active.set --scan-model=0 --output-path=$HOME/scan_detection/scan_logs/${this1h}_scan0.txt

#/usr/local/bin/rwsiteinfo --fields=sensor >> $HOME/scan_detection/${this1h}_scan0.txt
