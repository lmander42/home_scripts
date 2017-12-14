#!/usr/bin/env bash

# forbesread - script for reading multi-page list from forbes
#
# @author Marion Anderson
# @date   2017-12-14

# Setup -------------------------------------------------------------
set -o errexit

# URL of List -------------------------------------------------------
url="http://www3.forbes.com/leadership/the-25-most-underpaid-jobs-in-america/"

# RegEx of Line with Data -------------------------------------------
# - any line with a number between 0 and 99 followed by
#   a period and a space ". "
data_regex=".*[0-9]{1,2}\. .*"

# Number of Pages in List -------------------------------------------
# src: https://linuxconfig.org/how-to-extract-a-number-from-a-string-using-bash-example
num=$(echo "$url" | grep -o -E "\-[0-9]{1,}\-")  # number will be surrounded by dashes
num=${num#-}  # remove preceding dash
num=${num%-}  # remove trailing dash
num=$(expr $num + 1)

# Getting List ------------------------------------------------------
i=2
while [ $i -le $num ]
do

    # Retrieving Web Page
    # save relevant line of HTML for post-processing
    # don't forget to redirect curl's debug logs away from STDOUT
    data_line=$(curl "$url$i/" 2>/dev/null | grep -E "$data_regex")

    # Post-Processing
    line1=${data_line#*strong>}  # remove HTML preceding useful text
    line2=${line1%</strong*}     # remove HTML trailing useful text

    # Output
    echo "$line2"

    # Next Loop
    i=$(expr $i + 1)
done

exit 0
