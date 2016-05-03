#!/usr/bin/evn python

import os
import shutil
import datetime

dirpath = "/netflow"

targetdate = (datetime.datetime.now()-datetime.timedelta(days=30)).strftime('%Y/%m/%d')

for root, dirs, _ in os.walk(dirpath):
    if not dirs and root.endswith(targetdate):
        shutil.rmtree(root, ignore_errors=True)
