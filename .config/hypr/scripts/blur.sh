#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword decoration:blur:enabled true;\
        keyword decoration:blur:size 1;\
    "
    exit
else
    hyprctl --batch "\
        keyword decoration:blur:enabled true;\
        keyword decoration:blur:size 5;\
    "
    exit
fi
hyprctl reload
