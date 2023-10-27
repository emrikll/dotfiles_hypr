exec swayidle -w \
    timeout 600 'swaylock -f -c 000000' \
    timeout 800 'swaymsg "output * dpms off"' \
       resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -f -c 000000'
