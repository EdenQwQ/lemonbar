local handle = assert(io.popen("xdotool getmouselocation | cut -d ' ' -f 1 | cut -c 3-", "r"))
local mouse_x = assert(handle:read('*a'))
handle:close()
handle = assert(io.popen("cat ~/scripts/lemonbar/.x", "r"))
local x = assert(handle:read('*a'))
handle:close()
handle = assert(io.popen("cat ~/scripts/lemonbar/.width", "r"))
local width = assert(handle:read('*a'))
-- handle = assert(io.popen("xdotool get_num_desktops", "r"))
-- local num = assert(handle:read('*a'))
-- handle:close()
local len = require("./widgets").workspace.len
local ave = (width) * 2 / (len - 1)
local clicked = math.ceil((mouse_x - x) / ave)
if clicked > 0 and clicked <= (len - 1) / 2 then
  print(clicked - 1)
end
