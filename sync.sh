#!/usr/bin/env bash
# Copy data between tower and laptop
#
# @author Marion Anderson
set -o pipefail -o nounset
trap "exit" INT  # respond to ctrl-c

help()
{
    printf 'Usage: hwsync [-h]\n'
    printf 'Sync ~/Documents/umich between tower and laptop\n\n'
    exit 0
}

# HELP DIALOG
if [ $# -gt 0 ]; then help; fi

# SYNC
# directories to sync
basedir=/home/lowdrant
dirs=(research Documents Pictures)  # in order of priority

# choose host
if [ $(hostname) = 'marion-tower' ]
then
    tgt="lowdrant@mx.local"
else
    tgt="lowdrant@marion-tower.local"
fi

for dir in ${dirs[@]}
do
    curdir="$basedir/$dir/"  # trailing '/' indicates directory
    curtgt="$tgt:$basedir/$dir/"
    echo $curdir $curtgt
    rsync -avhuz -e ssh "$curdir" "$curtgt"
    rsync -avhuz -e ssh "$curtgt" "$curdir"
done
