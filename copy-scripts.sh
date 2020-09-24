#!/usr/bin/env bash
#
#  Copies scripts into /usr/bin
#

# Check for user bin directory
if [ ! -e "$HOME/bin" ]
then
    mkdir "$HOME/bin"
fi

# Check for appropriate path
grep -E "export PATH=.*\$HOME/bin.*" $HOME/.profile &> /dev/null
if [ $? -ne 0 ]
then
    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.profile
fi
source "$HOME/.bashrc"

# Copy non-global scripts
fdir=$(dirname $(realpath $0))
for i in "$fdir/"*
do
    echo $i
    echo "$i" | grep vol &> /dev/null
    if [ $? -ne 0 ]
    then
        cp "$i" "$HOME/bin"
    fi
done

# Global scripts to /opt/home_scripts
if [ ! -d /opt/home_scripts ]
then
    sudo mkdir /opt/home_scripts
fi
sudo cp "$fdir/"*vol* /opt/home_scripts/
sudo chmod +x /opt/home_scripts/*
