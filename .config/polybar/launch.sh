#!/usr/bin/env bash

if pgrep -x polybar > /dev/null; then
    echo "Polybar main running, killing..." | tee -a /tmp/polybarmain.log
    killall polybar
else
    echo "---" | tee -a /tmp/polybarmain.log
    polybar main 2>&1 | tee -a /tmp/polybarmain.log & disown
    echo "Polybar main launched..."
fi
