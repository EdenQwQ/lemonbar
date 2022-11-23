local c = require("themes/" .. "catppuccin_mocha")

local handle = assert(io.popen("xdotool get_num_desktops", "r"))
local num = assert(handle:read('*a'))
handle:close()

local widgets = {}

local theme = {
  foreground = c.pink,
  background = c.base,
  secondary = c.blue,
  fade = c.surface2,
  fade2 = c.surface0
}

widgets.battery = {
  color = {
    foreground = theme.foreground,
    background = theme.background,
  },
  action = {
    lclick = "powerprofilesctl set power-saver && dunstify -h string\\:x-dunst-stack-tag\\:power-mode Power-saver mode",
    mclick = "powerprofilesctl set balanced && dunstify -h string\\:x-dunst-stack-tag\\:power-mode Balanced mode",
    rclick = "powerprofilesctl set performance && dunstify -h string\\:x-dunst-stack-tag\\:power-mode Performance mode",
  },
  command = "./battery.sh",
  len = 6,
  interval = 10,
  inner_gap = 1,
}

widgets.workspace = {
  color = {
    foreground = theme.fade,
    background = theme.background,
    focus = theme.foreground,
    occupied = theme.secondary
  },
  action = {
    lclick = "xdotool set_desktop $(lua ./switch-workspace.lua)",
    rclick = "xdotool set_desktop_for_window $(xdotool getwindowfocus) $(lua ./switch-workspace.lua)$"
  },
  command = "lua ./workspace.lua",
  len = num + (num + 1) * 1,
  interval = 0.1,
  inner_gap = 1,
}

widgets.date = {
  color = {
    foreground = theme.secondary,
    background = theme.background
  },
  action = {
    lclick = "kitty -e calcurse",
  },
  command = "echo  $(date \"+%y.%m.%d %a\")",
  len = 15,
  interval = 100,
  inner_gap = 1,
}

widgets.time = {
  color = {
    foreground = theme.foreground,
    background = theme.background
  },
  action = {
    lclick = "kitty tty-clock -s -c -C 5 -D",
  },
  command = "echo \" $(date \"+%H:%M:%S\")\"",
  len = 11,
  interval = 1,
  inner_gap = 1,
}

widgets.volume = {
  color = {
    foreground = theme.secondary,
    background = theme.background
  },
  action = {
    lclick = "amixer set Master toggle -q",
    scrollup = "amixer set Master 5%+ -q",
    scrolldown = "amixer set Master 5%- -q"
  },
  command = "./vol.sh",
  len = 7,
  interval = 0.1,
  inner_gap = 1,
}

widgets.backlight = {
  color = {
    foreground = theme.foreground,
    background = theme.background
  },
  action = {
    lclick = "light -S 20",
    scrollup = "light -A 5",
    scrolldown = "light -U 5"
  },
  command = "echo  $(light -G | cut -d . -f 1)",
  len = 5,
  interval = 0.1,
  inner_gap = 1
}

widgets.memory = {
  color = {
    foreground = theme.foreground,
    background = theme.background
  },
  action = {
    lclick = "kitty htop",
  },
  command = "echo  $(free -h --mega | awk '/^Mem:/ {print $3 \"/\" $2}')",
  len = 11,
  interval = 1,
  inner_gap = 1,
}

widgets.windowname = {
  color = {
    foreground = theme.secondary,
    background = theme.background
  },
  command = "echo $(xdotool getwindowfocus | xargs xdotool getwindowname | sd 'qutebrowser' 'qutebrowser' | cut -c 1-16 ) ...",
  len = 20,
  interval = 0.1,
  inner_gap = 1
}

widgets.wifi = {
  color = {
    foreground = theme.secondary,
    background = theme.background
  },
  action = {
    lclick = "kitty nmtui",
  },
  command = "echo 直 $(cat /sys/class/net/w*/operstate)",
  len = 5,
  interval = 10,
  inner_gap = 1
}

widgets.music = {
  color = {
    foreground = theme.secondary,
    background = theme.background,
    control = theme.foreground
  },
  command = "lua ./music.lua",
  len = 27,
  interval = 0.1,
  inner_gap = 1
}

widgets.volumebar = {
  color = {
    foreground = theme.secondary,
    background = theme.background,
    muted = theme.fade,
    high = theme.foreground,
    barbg = theme.fade2
  },
  action = {
    lclick = "amixer set Master toggle -q",
    scrollup = "amixer set Master 5%+ -q",
    scrolldown = "amixer set Master 5%- -q"
  },
  command = "lua ./volumebar.lua",
  len = 13,
  interval = 0.1,
  inner_gap = 1
}

return widgets
