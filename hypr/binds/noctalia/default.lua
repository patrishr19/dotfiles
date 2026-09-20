-- GENERAL
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

-- WINDOW SWITCHER
-- hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"))

-- SESSION
hl.bind(mainMod .. "+ALT +L", hl.dsp.exec_cmd(ipc .. "session lock"))

-- BAR
hl.bind(mainMod .. "+F3", hl.dsp.exec_cmd(ipc .. "bar-toggle"))

-- PANELS
hl.bind("+ALT +F4", hl.dsp.exec_cmd(ipc .. "panel-open session"))
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(ipc .. "panel-open clipboard"))
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. "+Tab", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))

-- DOCK

-- DESKTOP WIDGETS

-- LOCKSCREEN WIDGETS

-- NOTIFICATIONS
hl.bind(mainMod .. "+F1", hl.dsp.exec_cmd(ipc .. "notification-dnd-toggle"))

-- CLIPBOARD

-- MEDIA
hl.bind("CTRL + ALT + Left", hl.dsp.exec_cmd(ipc .. "media previous"))
hl.bind("CTRL + ALT + Right", hl.dsp.exec_cmd(ipc .. "media next"))
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(ipc .. "media toggle"))

-- WALLPAPER

-- THEME

-- SCREENSHOTS
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind(mainMod .. "+Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))

-- PLUGINS

-- OSD

-- VOLUME
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))

hl.bind("CTRL + ALT + Up", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("CTRL + ALT + Down", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("CTRL + ALT + M", hl.dsp.exec_cmd(ipc .. "volume-mute"))

-- MICROPHONE

-- BRIGHTNESS
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- NIGHTLIGHT
hl.bind(mainMod .. "+F4", hl.dsp.exec_cmd(ipc .. "nightlight-toggle"))

-- WIRELESS

-- CAFFEINE
hl.bind(mainMod .. "+F2", hl.dsp.exec_cmd(ipc .. "caffeine-toggle"))

-- POWER PROFILES
hl.bind(mainMod .. "+F5", hl.dsp.exec_cmd(ipc .. "power-cycle"))

-- MONITOR POWER

