#!/usr/bin/env bash

if [ $1 == "l" ]
then
    ## LIGHT THEME
    # Firefox and GTK apps - no lol
    # Terminal
    sed -i "s/dark/light/" ~/.config/foot/foot.ini
    # Neovim
    sed -i "2s/midnight/paper/" ~/.config/nvim/lua/undefined_user/plugins/colors.lua
    sed -i "10s/white/black/" ~/.config/nvim/lua/undefined_user/plugins/colors.lua
    # Tmux
    # Background statusbar
    sed -i "19s/colour232/colour252/g" ~/.config/tmux/tmux.conf
    # Text
    sed -i "20s/colour252/colour232/g" ~/.config/tmux/tmux.conf
    sed -i "24s/colour252/colour232/g" ~/.config/tmux/tmux.conf
    # Swaylock
    sed -i "s/black/white/" ~/.config/sway/config.d/autostart
    sed -i "s/black/white/" ~/.config/sway/config.d/system_n_peripherals
    sed -i "s/black/white/" ~/.local/bin/powermenu
    # Bemenu - Maybe not 🤭
    # Waybar
    sed -i "s/white/black/g" ~/.config/waybar/style.css
    sed -i '28s/.*/background-color: rgba(255, 255, 255, 0.8);/g' ~/.config/waybar/style.css

    # Sway
    sed -i "10s/.*/client.focused #000000 #000000 #FFFFFF #000000 #000000/g" ~/.config/sway/config.d/system_n_peripherals
    sed -i "11s/.*/client.unfocused #808080 #808080 #FFFFFF #808080 #808080/g" ~/.config/sway/config.d/system_n_peripherals

    # RESTART
    swaymsg "exec pkill waybar && swaymsg reload" && pkill foot && tmux kill-server 
    notify-send "Switch to Light Now!" -t 3000
elif [ $1 == "d" ]
then
    ## DARK THEME
    # Firefox and GTK apps
    sed -i "s/0/1/" ~/.config/gtk-3.0/settings.ini
    # Terminal
    sed -i "s/light/dark/" ~/.config/foot/foot.ini
    # Neovim
    sed -i "2s/paper/midnight/" ~/.config/nvim/lua/undefined_user/plugins/colors.lua
    sed -i "10s/black/white/" ~/.config/nvim/lua/undefined_user/plugins/colors.lua
    # Tmux
    # Background statusbar
    sed -i "19s/colour252/colour232/g" ~/.config/tmux/tmux.conf
    # Text
    sed -i "20s/colour232/colour252/g" ~/.config/tmux/tmux.conf
    sed -i "24s/colour232/colour252/g" ~/.config/tmux/tmux.conf
    # Swaylock
    sed -i "s/white/black/" ~/.config/sway/config.d/autostart
    sed -i "s/white/black/" ~/.config/sway/config.d/system_n_peripherals
    sed -i "s/white/black/" ~/.local/bin/powermenu
    # Bemenu - Maybe not 🤭
    # Waybar
    sed -i "s/black/white/g" ~/.config/waybar/style.css
    sed -i '28s/.*/background-color: rgba(0, 0, 0, 0.8);/g' ~/.config/waybar/style.css

    # Sway
    sed -i "10s/.*/client.focused #FFFFFF #FFFFFF #000000 #FFFFFF #FFFFFF/g" ~/.config/sway/config.d/system_n_peripherals
    sed -i "11s/.*/client.unfocused #808080 #808080 #000000 #808080 #808080/g" ~/.config/sway/config.d/system_n_peripherals

    swaymsg "exec pkill waybar && swaymsg reload" && pkill foot && tmux kill-server
    notify-send "Switch to Dark Now!" -t 3000
fi
