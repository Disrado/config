setxkbmap -layout 'us,ru' -option 'grp:shifts_toggle, grp_led:scroll'

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

exec awesome
