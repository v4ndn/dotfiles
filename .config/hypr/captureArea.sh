
nowdate=$(date +%Y-%m-%d_%H:%M:%S)


grim -g "$(slurp)" ~/Pictures/Screenshots/$nowdate
sleep .5
wl-copy < ~/Pictures/Screenshots/$nowdate

