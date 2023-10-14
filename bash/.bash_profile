#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add ~/.local/bin to $PATH if necessary
if [[ -d "$HOME/.local/bin" && -z $(echo $PATH | grep -o "$HOME/.local/bin") ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# NumLock on
setleds -D +num

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
   exec startx
fi
