#!/bin/bash

PID=$(pgrep -f "bash infinite.sh")

if [ ! -z "$PID" ]; then
    kill $PID
    echo "infinite.sh has been killed."
else
    echo "No infinite.sh process found."
fi