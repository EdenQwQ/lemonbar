local handle = assert(io.popen("amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | cut -d % -f 1", "r"))
local volume = assert(handle:read('*a'))
handle:close()
handle = assert(io.popen("amixer sget Master | grep off", "r"))
local muted = assert(handle:read('*a'))
handle:close()

local percent = math.ceil(volume / 10)
local color = require("./widgets").volumebar.color
local bar_icon = ''

if muted == "" then
  if percent <= 5 then
    print("%{F#" ..
      color.foreground ..
      "}墳%{F#" ..
      color.foreground .. "} " .. (bar_icon):rep(percent) .. "%{F#" .. color.barbg .. "}" .. (bar_icon):rep(10 - percent))
  else
    print("%{F#" ..
      color.foreground ..
      "}墳%{F#" ..
      color.high .. "} " .. (bar_icon):rep(percent) .. "%{F#" .. color.barbg .. "}" .. (bar_icon):rep(10 - percent))
  end
else
  print("%{F#" ..
    color.foreground ..
    "}墳%{F#" ..
    color.muted .. "} " .. (bar_icon):rep(percent) .. "%{F#" .. color.barbg .. "}" .. (bar_icon):rep(10 - percent))
end
