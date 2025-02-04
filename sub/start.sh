#!/bin/sh

PID_NAME=clash
PID_NUM=`ps -ef |grep -w $PID_NAME|grep -v grep|wc -l`

cd clashcheck/
while true
do
    if [ $PID_NUM -le 0 ];then
       /usr/bin/timeout -k 20 4m /usr/bin/python main.py
    else
       pkill -9 clash && sleep 24
    fi
done
