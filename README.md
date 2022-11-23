# My lemonbar config written mostly in **lua**

## Usage

### Dependencies

- lemonbar
- lua
- xdotool (for workspaces)
- playerctl (for music)
- amixer (for volume)
- light (for backlight)

### Run

```bash
git clone https://github.com/EdenQwQ/lemonbar.git
cd lemonbar
./bar.lua | bash
```

Remember to add `| bash` in order to get proper feedback for click/scroll actions.

### Configure

Edit `bar.lua` to config the bar's height, font, font size, etc.

Edit `layout.lua` to config the layout for widgets.

Edit the first line of `widgets.lua` to change the theme. (all flavors of catppuccin are available)

## Actions

> In order to get all of the actions work properly, you may want to install htop, nmtui, tty-clock, calcurse, powerprofilesctl

- Left click the numbers on the workspace widget to switch workspace.
- Right click the numbers on the workspace widget to move the focused window to the workspace.
- Left click the memory widget to run `htop`.
- The music widget supports media control (play/pause, next, previous).
- Left click the wifi widget to run `nmtui`.
- Scroll up/down on the backlight widget to increase/decrease screen brightness.
- Scroll up/down on the volume widget to increase/decrease volume.
- Left click the volume widget to mute/unmute.
- Left click the time widget to run `tty-clock`.
- Left click the date widget to run `calcurse`.
- Left click the battery widget to switch to power-save mode.
- Right click the battery widget to switch to performance mode.
- Middle click the battery widget to switch to balanced mode.
