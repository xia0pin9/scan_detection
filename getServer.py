import sys

results = {}

with open(sys.argv[1]) as f:
    for line in f:
        if "sIP" in line:
            continue
        lineSplit = [x.strip() for x in line.split("|")]
        if lineSplit[0] not in results:
            results[lineSplit[0]] = [lineSplit[1]]
        else:
            results[lineSplit[0]].append(lineSplit[1])

for host in results:
    if "80" in results[host]:
        print host, results[host]
