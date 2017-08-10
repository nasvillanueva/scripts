## Personal Shell Scripts

`batt.sh`
> Shows the battery percentage using lemonbar.
>
> I've used this with [BSPWM](bspwm) since it doesn't built in panel

`battman`
> Changes the color of the active window to notify me if my battery is
> less than 15%
>
> Written for [BSPWM](bspwm)

`bspwm_workspaces`
> Initializes my [BSPWM](bspwm) workspaces. It is also called when
> I plugged in a new monitor so that the workspaces on that monitor will
> also be initialized

`clock.sh`
> Shows the current date and time
>
> I've used this with [BSPWM](bspwm) since it doesn't built in panel


`hotplug.sh`
> Executes `xrandr` commands to setup the newly plugged display. This
> script also calls `bspwm_workspaces` if my current window manager is
> [BSPWM](bspwm)

`light`
> Pops up a notification that my screen brightness has been increased or
> decreased. 

`ngrok`
> Check [Ngrok's Website](https://ngrok.com/)

`lock`
> Takes a screenshot of my desktop then sets it as my lockscreen wallpaper
> then locks my computer.
>
> Written for any Window Manager I use

`notifyd`
> Notification Daemon for custom scripts

`notifyd-libnotify`
> Notification Daemon for libnotify

`popup`
> Pops up a scrolling message either from `notifyd` or `notifyd`
>
> Used [z3bra](https://z3bra.org)'s skroll library for scrolling text

`screenshot`
> Takes a screenshot of my desktop using scrot

`shutdown_menu`
> Pops up a custom shutdown menu using
> [Rofi](https://davedavenport.github.io/rofi/)

`spaceinvaders.sh`
> Shows spaceinvaders to display terminal colors
>
> Downloaded from some github repo


`stats`
> Pops up a lemonbar that shows the current status of my machine

`touchpadopts`
> Enables tap actions for my touchpad 

`transfer_images.sh`
> Transfers docker images from one repo to another

`vol`
> Changes my volume status (+, -, mute) and then pops up a notification to
> show the volume status

`wall-e`
> Changes my wallpaper and applies some modifications


[bspwm]: https://github.com/baskerville/bspwm
