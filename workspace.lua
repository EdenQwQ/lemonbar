local handle = assert(io.popen("xdotool get_desktop", "r"))
local current = assert(handle:read('*a'))
handle:close()

handle = assert(io.popen("xdotool get_num_desktops", "r"))
local num = assert(handle:read('*a'))
handle:close()

handle = assert(io.popen("wmctrl -l | awk '{print $2}' | sd '\n' ' '", "r"))
local get_active = assert(handle:read('*a'))
local active = {}
for i in get_active:gmatch("%S+") do
  table.insert(active, ("%d"):format(i))
end
handle:close()

local options = require("./widgets").workspace
local color = options.color
local gap = options.inner_gap

local gaps = string.rep(' ', gap)
local output = gaps

local function is_in(value, table)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

for i = 0, (num - 1) do
  if ("%d"):format(i) == ("%d"):format(current) then
    output = output .. "%{F#" .. color.focus
        .. "}%{B#" .. color.background .. "}"
        .. i + 1 .. gaps
  elseif is_in(("%d"):format(i), active) then
    output = output .. "%{F#" .. color.occupied
        .. "}%{B#" .. color.background .. "}"
        .. i + 1 .. gaps
  else
    output = output .. "%{F#" .. color.foreground
        .. "}%{B#" .. color.background .. "}"
        .. i + 1 .. gaps

  end
end

print(output)
