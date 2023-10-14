## My Dotfiles

I'm currently trying out [stow][] to manage my dotfiles. There are other alternatives, eg. [bare git][] repos and I've
tried some of the alternatives, but haven't been truly satisfied with any yet so I'm still searching.

To use this, as is, clone this repository into `~/dotfiles` and do

```sh 
cd ~/dotfiles 
stow --restow */ 
```

stow will automatically symlink the contents of each "package" into the parent directory from where it is invoked. 
Usually this will be your home directory, but if it isn't, you can use the `--target` option:

```sh 
cd ~/path/to/dotfiles 
stow --target=$HOME --restow */ 
```

## Must have

A short list of some of my 'must have' on my computer:

* [archlinux][] - a simple, lightweight linux distribution
* [i3][] - a tiling window manager
* [qutebrowser][] - a keyboard-focused browser
* [vim][] - the ubiquitous text editor
* [iosevka][] - versatile typeface for code, from code
* [nord][] - an arctic, north-bluish color palette

And this is what it might look like:

<img src="./.images/clean.png" width="500">
<img src="./.images/busy.png" width="500">

[stow]: https://www.gnu.org/software/stow/
[bare git]: https://www.atlassian.com/git/tutorials/dotfiles
[archlinux]: https://archlinux.org/
[i3]: https://i3wm.org/
[iosevka]: https://github.com/be5invis/Iosevka
[qutebrowser]: https://qutebrowser.org/
[vim]: https://www.vim.org/
[nord]: https://www.nordtheme.com/
