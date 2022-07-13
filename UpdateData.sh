#!/bin/bash

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

if [ ! -e "pcgen-master" ]; then
        # new / cold  checkout
        git clone --depth 1 "https://github.com/PCGen/pcgen.git" "pcgen-master" || { echo "ERROR cloning repository, aborting!"; exit 2; }
else
        # update / hot pull
        cd pcgen-master && git pull || { echo "ERROR updating repository, aborting!"; exit 4; }
fi

rsync -av --progress "$WORKDIR/pcgen-master/data/" "$DISTDIR/data/" || { echo "ERROR syncing updates, aborting!"; exit 8; }
