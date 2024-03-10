#!/bin/sh

notify-send "Playing: $(yt-dlp $(wl-paste) --skip-download -e)" && umpv $(wl-paste)
