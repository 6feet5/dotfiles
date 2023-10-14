#!/usr/bin/env bash
# based on: https://github.com/cdown/passmenu

shopt -s nullglob globstar

#eval $(awk <~/.themes/terminal/nord '/define/ { print "export " $2 "=" $3 }')

font="Iosevka Nerd Font:size=11"
dmenucmd=( dmenu -i -p "PWD:" -fn "$font" -nb "$(xrdb -get .color0)" -nf "$(xrdb -get .color15)" -sb "$(xrdb -get .color11)" -sf "#000000" )

prefix=${PASSWORD_STORE_DIR:-~/.password-store}
files=( "$prefix"/**/*.gpg )
files=( "${files[@]#"$prefix"/}" )
files=( "${files[@]%.gpg}" )
fbase=( "${files[@]##*/}" )

word=$(printf '%s\n' "${fbase[@]}" | "${dmenucmd[@]}" "$@")

if [[ -n $word ]]; then
  for match in "${files[@]}"; do  
    if [[ $word == ${match#*/} ]]; then
      /usr/bin/pass show -c "$match" 2>/dev/null
    fi  
  done
fi
