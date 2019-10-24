# follow.py
#
# Follow a file like tail -f.

import time
def follow(thefile):
    thefile.seek(0,2)
    print(f"gathering new lines")
    while True:
        print(f"waiting for new lines")
        line = thefile.readline()
        if not line:
            time.sleep(0.1)
            continue
        yield line

if __name__ == '__main__':
    logfile = open("inputForLed.txt","r")
    print(f"reading file")
    loglines = follow(logfile)
    print(f"passed loglines")
    for line in loglines:
        print(f"{line}")
