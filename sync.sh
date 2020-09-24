#!/usr/bin/env bash
# Copy data between tower and laptop
#
# @author Marion Anderson
set -o pipefail -o nounset

help()
{
    printf 'Usage: hwsync [-h]\n'
    printf 'Sync ~/Documents/umich between tower and laptop\n\n'
    exit 0
}

# Syncing & Help Dialog
if [ $# -gt 0 ]; then help; fi
# sync homework
dir="/home/lowdrant/Documents/"
tgt="lowdrant@mx.local:$dir"
rsync -avhuz -e ssh "$dir" "$tgt"
rsync -avhuz -e ssh "$tgt" "$dir"
# sync cad
#tgt="lowdrant@mx.local:/home/lowdrant/Documents/cad/"
#rsync -avhuz -e ssh "$HOME/Documents/cad/" "$tgt"
#rsync -avhuz -e ssh "$tgt" "$HOME/Documents/cad/"
