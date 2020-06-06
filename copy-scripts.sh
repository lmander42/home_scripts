#!/usr/bin/env bash
#
#  Copies scripts into /usr/bin
#

# Check for user bin directory
if [ ! -e $HOME/bin ]
then
    mkdir $HOME/bin
fi

# Check for appropriate path
grep -E "export PATH=*\$HOME/bin*" $HOME/.profile
if [ $? -ne 0 ]
then
    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.profile
fi
source $HOME/.bashrc

# Copy
fdir=$(dirname $(realpath $0))
for i in $fdir/*
do
    cp $i $HOME/bin
done
