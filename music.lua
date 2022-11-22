local maxlen = 17

local handle = assert(io.popen("playerctl -s status", "r"))
local status = assert(handle:read('*a')):sub(1, -2)
handle:close()

local control_color = require("./widgets").music.color.control

if status == "" then
  print(" What about some music?")
else
  local icon = ""
  if status == "Playing" then
    icon = " "
  else
    icon = " "
  end
  local control = "%{F#" ..
      control_color .. "}" .. "%{A:playerctl -a -s previous:}玲%{A} %{A:playerctl -a -s play-pause:}" ..
      icon .. "%{A}%{A:playerctl -a -s next:}怜 %{A}%{F-}"
  handle = assert(io.popen("playerctl metadata --format '{{ title }}'", "r"))
  local title = assert(handle:read('*a')):sub(1, -2)
  handle:close()
  local content = ""
  if title:len() <= maxlen then
    content = title .. (" "):rep(maxlen - title:len())
  else
    content = title:sub(1, maxlen - 4) .. " ..."
  end
  print(" " .. content .. " " .. control)
end
