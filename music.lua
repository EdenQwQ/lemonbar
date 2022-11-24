local maxlen = 17

local handle = assert(io.popen("playerctl -s status", "r"))
local status = assert(handle:read('*a')):sub(1, -2)
handle:close()
if status == "" then
  print(" What about some music?")
else
  handle = assert(io.popen("playerctl metadata mpris:length", "r"))
  local length = assert(handle:read('*a')):sub(1, -2)
  handle:close()
  handle = assert(io.popen("playerctl position | cut -d '.' -f 1", "r"))
  local position = assert(handle:read('*a')):sub(1, -2)
  handle:close()

  for _ = 1, 6 do
    length = length:sub(1, -2)
  end

  local percent = ("%d"):format(position) / ("%d"):format(length)

  local color = require("./widgets").music.color

  local icon = ""
  local action = ""
  if status == "Playing" then
    icon = " "
    action = "pause"
  else
    icon = " "
    action = "play"
  end
  local control = "%{F#" ..
      color.control .. "}" .. "%{A:playerctl -a -s previous:}玲%{A} %{A:playerctl -a -s " .. action .. ":}" ..
      icon .. "%{A}%{A:playerctl -a -s next:}怜 %{A}%{F-}"
  handle = assert(io.popen("playerctl metadata --format '{{ title }}'", "r"))
  local title = assert(handle:read('*a')):sub(1, -2)
  handle:close()
  local content = ""
  if title:len() <= maxlen then
    content = title .. (" "):rep(maxlen - 1 - title:len())
  else
    content = title:sub(1, maxlen - 4) .. "... "
  end
  local tocolor = math.floor(percent * maxlen)
  content = content:sub(1, tocolor) .. "%{B-}" .. content:sub(tocolor + 1)
  print("%{B#" .. color.bar .. "} " .. " " .. content .. control)
end
