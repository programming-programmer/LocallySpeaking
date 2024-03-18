#!/bin/sh

umpv $(wl-paste) && echo $(yt-dlp -e $(wl-paste)) - $(date) >> ~/.cache/youtube/history
