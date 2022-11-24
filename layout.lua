local widgets = require("widgets")

local layout = {
  left = {
    widgets.workspace, widgets.memory, widgets.music, widgets.cava
  },
  right = {
    widgets.battery, widgets.date, widgets.time, widgets.volumebar, widgets.backlight
  }
}

return layout
