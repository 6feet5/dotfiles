#--------------------------------------------------
# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# author:   johan stenarson - http://stenarson.com/
#--------------------------------------------------

import subprocess

# Read .Xresources to get theme colors
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

c.colors.completion.category.bg = xresources['*.color8']
c.colors.completion.category.border.bottom= xresources['*.color0']
c.colors.completion.category.border.top= xresources['*.color0']
c.colors.completion.category.fg = xresources['*.color15']
c.colors.completion.fg = xresources['*.color15']
c.colors.completion.item.selected.bg = xresources['*.color11']
c.colors.completion.item.selected.border.bottom = xresources['*.color11']
c.colors.completion.item.selected.border.top = xresources['*.color11']
c.colors.completion.item.selected.fg = xresources['*.color0']
c.colors.completion.match.fg = xresources['*.color10']
c.colors.completion.odd.bg = xresources['*.color0']
c.colors.completion.even.bg = xresources['*.background']

c.colors.downloads.bar.bg = xresources['*.color0']
c.colors.downloads.error.fg = xresources['*.color9']
c.colors.downloads.start.bg = xresources['*.color2']
c.colors.downloads.start.fg = xresources['*.color15']
c.colors.downloads.stop.bg = xresources['*.color2']
c.colors.downloads.stop.fg = xresources['*.color15']

c.colors.messages.error.bg = xresources['*.color9']
c.colors.messages.error.border = xresources['*.color9']
c.colors.messages.error.fg = xresources['*.color15']
c.colors.messages.info.bg = xresources['*.color4']
c.colors.messages.info.border = xresources['*.color12']
c.colors.messages.info.fg = xresources['*.color15']
c.colors.messages.warning.bg = xresources['*.color3']
c.colors.messages.warning.border = xresources['*.color11']
c.colors.messages.warning.fg = xresources['*.color15']

c.colors.statusbar.command.bg = xresources['*.color0']
c.colors.statusbar.command.fg = xresources['*.color15']
c.colors.statusbar.normal.bg = xresources['*.color0']
c.colors.statusbar.normal.fg = xresources['*.color15']
c.colors.statusbar.progress.bg = xresources['*.color15']
c.colors.statusbar.url.error.fg = xresources['*.color9']
c.colors.statusbar.url.fg = xresources['*.color15']
c.colors.statusbar.url.hover.fg = xresources['*.color11']
c.colors.statusbar.url.success.http.fg = xresources['*.color10']
c.colors.statusbar.url.success.https.fg = xresources['*.color10']
c.colors.statusbar.url.warn.fg = xresources['*.color11']

c.colors.tabs.bar.bg = xresources['*.color0']
c.colors.tabs.even.bg = xresources['*.color8']
c.colors.tabs.even.fg = xresources['*.color15']
c.colors.tabs.indicator.error = xresources['*.color9']
c.colors.tabs.indicator.start = xresources['*.color15']
c.colors.tabs.indicator.stop = xresources['*.color15']
c.colors.tabs.odd.bg = xresources['*.color0']
c.colors.tabs.odd.fg = xresources['*.color7']
c.colors.tabs.selected.even.bg = xresources['*.color12']
c.colors.tabs.selected.even.fg = xresources['*.color0']
c.colors.tabs.selected.odd.bg = xresources['*.color12']
c.colors.tabs.selected.odd.fg = xresources['*.color15']

c.auto_save.session = True
c.content.autoplay = False
c.content.geolocation = False
c.content.pdfjs = True
c.downloads.location.directory = '~/Downloads/staging_folder/'
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.remove_finished = 3000
c.editor.command = ["alacritty", "--title", "scratchpad", "-e", "nvim", "-f", "{file}"]
c.fonts.default_family = "Iosevka Nerd Font Mono"
c.hints.chars = "123456789"
c.hints.mode = "number"
c.keyhint.blacklist = ["*"]
c.prompt.filebrowser = False
c.tabs.background = True
c.tabs.title.format = "{current_title}"
c.tabs.favicons.show = "never"
c.tabs.select_on_remove = "prev"

# search engines
c.url.searchengines = {
   'DEFAULT': 'https://duckduckgo.com/?q={}',

   'pip':   'https://pypi.org/search/?q={}&o=',
   'ap':    'https://www.archlinux.org/packages/?q={}',
   'au':    'https://aur.archlinux.org/packages/?O=0&K={}',
   'aur':   'https://aur.archlinux.org/packages/?O=0&K={}',
   'aw':    'https://wiki.archlinux.org/?search={}',
   'cpp':   'https://en.cppreference.com/mwiki/index.php?search={}',
   'gh':    'https://github.com/search?q={}',
   'gi':    'https://www.google.com/search?tbm=isch&q={}',
   'gl':    'https://www.google.com/search?hl=en&source=hp&q={}',
   'gm':    'https://maps.google.com/maps?q={}',
   'iid':   'http://www.isitdownrightnow.com/{}.html',
   'imdb':  'https://www.imdb.com/find?q={}',
   'man':   'http://jlk.fjfi.cvut.cz/arch/manpages/search?q={}',
   'pj':    'https://www.prisjakt.nu/search?search={}',
   'rock':  'https://rawkbawx.rocks/torrents.php?search={}',
   'so':    'https://stackoverflow.com/search?q={}',
   'tl':    'https://www.torrentleech.org/torrents/browse/index/categories/9,11,37,43,14,12,13,41,47/query/{}',
   'wp':    'https://en.wikipedia.org/?search={}',
   'yt':    'https://www.youtube.com/results?search_query={}',
   'py':    'https://docs.python.org/3/search.html?q={}',
   }

# key bindings
config.unbind('b', mode='normal')
config.unbind('go', mode='normal')
config.unbind('O', mode='normal')
config.bind('b', 'back', mode='normal')
config.bind('<Ctrl-e>', 'spawn alacritty -e vim .config/qutebrowser/config.py', mode='normal')
config.bind('I', 'jseval -q -f ~/.local/share/qutebrowser/scripts/cycle-inputs.js')
config.bind('O', 'set-cmd-text :open {url:pretty}', mode='normal')
config.bind('<Ctrl-Right>', 'tab-next', mode='normal')
config.bind('<Ctrl-Left>', 'tab-prev', mode='normal')
config.bind(',p', 'spawn --userscript qute-pass -U secret -u "username=(.+)" -P "password=(.*)"')
config.bind(',f', 'open {primary}')
config.bind(',F', 'open --tab {primary}')
config.bind(',d', 'hint links spawn --detach youtube-dl {hint-url}')
config.bind(',v', 'hint links spawn --detach mpv --force-window yes {hint-url}')

config.load_autoconfig()
