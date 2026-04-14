#!/bin/sh

# 1. verify 2  parameters input
if [ $# -lt 2 ]; then
    echo "Error : Require 2 parameters"
    echo "Usage : $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# 2.  get  file path exclude file name
dirpath=$(dirname "$writefile")

# 3. create the path if not exists
# -p crete the in auto
if ! mkdir -p "$dirpath"; then
    echo "Error : unable to create path $dirpath"
    exit 1
fi

# 4. write the content to file  
#  > will overwrite exist file
if ! echo "$writestr" > "$writefile"; then
    echo "Error : unable to writ $writefile"
    exit 1
fi

# default exit 0
