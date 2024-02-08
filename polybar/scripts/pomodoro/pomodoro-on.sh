#!/bin/bash

WORK_MINUTES=30
WORK_BG="B#FB4934"
BREAK_MINUTES=5
BREAK_BG="B#83a598"
FG="F#282828"
PAD="  "

BG=$WORK_BG
minutes=$WORK_MINUTES
seconds=0
mode="WORK"
echo "%{$BG}%{$FG}$PAD$mode $minutes:$seconds$PAD%{F-}%{B-}" > pomodoro.txt

# count down time
while :
do
    # get current status
    status=$(cat pomodoro.txt)

    # update timer if read
    if [ "$status" = "READ" ]; then

        # update minute
        if [ $seconds = 0 ]; then
            # update mode 
            if [ $minutes = 0 ]; then
                if [ $mode = "WORK" ]; then
                    mode="BREAK"
                    minutes=$BREAK_MINUTES
                    seconds=0
                    BG=$BREAK_BG
                else
                    mode="WORK"
                    minutes=$WORK_MINUTES
                    seconds=0
                    BG=$WORK_BG
                fi
            else
                ((minutes--))
                seconds=59  
            fi
        # update seconds
        else
            ((seconds--))
        fi

        # write new data
        echo "%{$BG}%{$FG}$PAD$mode $minutes:$seconds$PAD%{F-}%{B-}" > pomodoro.txt

    # stop script
    elif [ "$status" = "Off" ]; then
        exit
    fi
done
