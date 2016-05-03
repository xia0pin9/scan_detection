#!/usr/bin/evn python

from datetime import datetime, timedelta
from subprocess import Popen, PIPE

format = '%Y/%m/%d:%H'
cur1h = (datetime.utcnow() - timedelta(hours=1)).strftime(format)
past6h = (datetime.utcnow() - timedelta(hours=6)).strftime(format)

print cur1h, past6h

command = ['rwfilter', '--start-date', past6h, '--end-date', cur1h, '-type', 'out,outweb,int2int', ]


#p = Popen(command, stdout=PIPE, bufsize=1)
#
#with p.stdout:
#    for line in iter(p.stdout.readline, b''):
#        print line,
#
#p.wait()
