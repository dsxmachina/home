#!/bin/bash
 
log=$HOME/.xlog
path=${1#file://}
 
if [ -d $path ]
then
     urxvt -e "ranger $path" &>> $log
else
     urxvt -e "ranger --selectfile=$path" &>> $log
fi
