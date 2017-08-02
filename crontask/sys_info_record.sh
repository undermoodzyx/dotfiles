#!/usr/bin/env bash

# cron task to record computer information
# cycle: once a month * * * */1 *
# output file
# e.g. like usage of disk..
# author: undermoodzyx

function separator() {
    echo "---------------" >> $OUTPUT_FILE
    echo >> $OUTPUT_FILE
}

# check if exists home dir
if [ -e ~ ]; then
    OUTPUT_FILE=~/.sys_info_log
else
    OUTPUT_FILE=/tmp/.sys_info_log
fi

# format time
date +%x--%X >> $OUTPUT_FILE

# memory snapshot
echo "memory snapshot:" >> $OUTPUT_FILE
free -h >> $OUTPUT_FILE
separator

# record disk usage
echo "disk usage" >> $OUTPUT_FILE
df -h >> $OUTPUT_FILE
separator
