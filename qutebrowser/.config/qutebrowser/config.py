#--------------------------------------------------
# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# author:   johan stenarson - http://stenarson.com/
#--------------------------------------------------

import catppuccin


c.auto_save.session = True
c.content.autoplay = False
c.content.geolocation = False
c.content.pdfjs = True
c.downloads.location.directory = '~/Downloads/staging_folder/'
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.remove_finished = 3000
c.editor.command = ["foot", "-e", "nvim", "-f", "{file}"]
c.fonts.default_family = "Iosevka Nerd Font Mono"
c.fonts.default_size = '12pt'
c.hints.chars = "123456789"
c.hints.mode = "number"
c.keyhint.blacklist = ["*"]
c.prompt.filebrowser = False
c.tabs.background = True
c.tabs.title.format = "{current_title}"
c.tabs.favicons.show = "never"
c.tabs.position = "left"
c.tabs.select_on_remove = "prev"

# search engines
c.url.searchengines = {
   'DEFAULT': 'https://duckduckgo.com/?q={}',

   'ddg':   'https://duckduckgo.com/?q={}',
   'pip':   'https://pypi.org/search/?q={}&o=',
   'ap':    'https://www.archlinux.org/packages/?q={}',
   'au':    'https://aur.archlinux.org/packages/?O=0&K={}',
   'aur':   'https://aur.archlinux.org/packages/?O=0&K={}',
   'aw':    'https://wiki.archlinux.org/?search={}',
   'cpp':   'https://duckduckgo.com/?sites=cppreference.com&q={}&ia=web+P',
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
config.bind('<Ctrl-e>', 'spawn foot -e nvim .config/qutebrowser/config.py', mode='normal')
config.bind('I', 'jseval -q -f ~/.local/share/qutebrowser/scripts/cycle-inputs.js')
config.bind('O', 'set-cmd-text :open {url:pretty}', mode='normal')
config.bind('<Ctrl-Right>', 'tab-next', mode='normal')
config.bind('<Ctrl-Left>', 'tab-prev', mode='normal')
config.bind(',p', 'spawn --userscript qute-pass --username-target secret --username-pattern "usr:(.+)" --password-pattern "(.*)"')
config.bind(',P', 'spawn --userscript qute-pass --password-only --password-pattern "(.*)"')
config.bind(',f', 'open {primary}')
config.bind(',F', 'open --tab {primary}')
config.bind(',d', 'hint links spawn --detach youtube-dl {hint-url}')
config.bind(',v', 'hint links spawn --detach mpv --force-window yes {hint-url}')

config.bind('goh', 'open http://homeassistant.lan:8123')
config.bind('gop', 'open http://192.168.1.80/admin')
config.bind('gor', 'open http://openwrt.lan/cgi-bin/luci')
config.bind('gos', 'open http://TL-SG105E.lan')

config.load_autoconfig()

catppuccin.setup(c, 'mocha', True)
