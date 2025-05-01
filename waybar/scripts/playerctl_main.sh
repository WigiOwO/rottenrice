#!/bin/bash

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

if [[ -z "$title" ]]; then
    echo '{"text": " No Music", "tooltip": "Nothing is playing"}'
else
    icon=""
    [[ "$status" == "Playing" ]] && icon=""
    echo "{\"text\": \"$icon $artist - $title\", \"tooltip\": \"$status\"}"
fi

