#!/bin/bash

# This version of the script relies on the user applying the variables to the script before running the script - avoiding hardlinks and making the script easier for anyone to run.
# The script struggles with spaces in the directory names so ensure your paths don't have spaces in your path names.
# If you're struggling to run the script, the command looks something like this: "bash UpdateData.sh /tmp /home/YourNameHere/programs/pcgen". Remember you're supplying the variables yourself when you run the script.

if [ $# -ne 2 ]; then
        echo "$0: Keep your PCGen data in sync with the repository"
        echo ""
        echo "Usage: $0 WORKDIR DISTDIR"
        echo ""
        echo "WORKDIR......place to store the Git checkout (Cache)"
        echo "DISTDIR......root directory of your PCGen install"
        exit -1
fi

WORKDIR="$1"
DISTDIR="$2"

cd $WORKDIR || { echo "ERROR entering WORKDIR, aborting!"; exit 1; }

if [ ! -e "blyatbeauty-master" ]; then
        # new / cold  checkout
        git clone --depth 1 "https://github.com/BlyatBeauty/PCGen-Data.git" "blyatbeauty-master" || { echo "ERROR cloning repository, aborting!"; exit 2; }
else
        # update / hot pull
        cd blyatbeauty-master && git pull || { echo "ERROR updating repository, aborting!"; exit 3; }
fi

rsync -s -av --protect-args --progress "$WORKDIR/blyatbeauty-master/" "$DISTDIR/" || { echo "ERROR syncing updates, aborting!"; exit 6; }
