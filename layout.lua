local widgets = require("widgets")

local layout = {
  left = {
    widgets.workspace, widgets.memory, widgets.music
  },
  right = {
    widgets.battery, widgets.date, widgets.time, widgets.volumebar, widgets.backlight, widgets.wifi
  }
}

return layout
