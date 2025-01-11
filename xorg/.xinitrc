# file:     ~/.xinitrc
# author:   johan stenarson - http://stenarson.com
#-------------------------------------------------

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.fehbg ]] && ~/.fehbg

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr
xset dpms 1800 0 0
xset s blank
xset s 600

dispwin ~/.config/DisplayCAL/CB322QK.icc

exec i3
