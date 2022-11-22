local widgets = require("widgets")

local layout = {
  left = {
    widgets.workspace, widgets.memory, widgets.music
  },
  right = {
    widgets.battery, widgets.date, widgets.time, widgets.volume, widgets.backlight, widgets.wifi
  }
}

return layout
