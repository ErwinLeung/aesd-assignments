#!/bin/sh

#  verify 2 parameters input
if [ $# -lt 2 ]; then
    echo "Require 2 parameters"
    echo "Usage : $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# check first parameter is directory
if [ ! -d "$filesdir" ]; then
    echo "Error : Directory '$filesdir' not exists"
    exit 1
fi

#  count number of files in current and sub directories
X=$(find "$filesdir" -type f | wc -l)

# count iile sum matched
#  -r recursive , -I ignore binary, searchstr target string
#  grep to search , wc -l count total line
Y=$(grep -rI "$searchstr" "$filesdir" | wc -l)

#  Output result
echo "The number of files are $X and the number of matching lines are $Y"

