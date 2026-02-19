#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(keychain --eval --quiet id_rsa)

# Add ~/.local/bin to $PATH if necessary
if [[ -d "$HOME/.local/bin" && -z $(echo $PATH | grep -o "$HOME/.local/bin") ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
   exec start-hyprland
fi
