-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- [[CONFIG]]
-- NOTE: This is where you actually apply your config choices.

--font
config.font_size = 14
config.font = wezterm.font("MonaspiceNe NFM")

--window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.debug_key_events = true

--theme
config.color_scheme = "Tokyo Night"

--dead keys, and left option remains left option
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.use_dead_keys = true
config.use_ime = true
config.keys = {
	{ key = "n", mods = "OPT", action = wezterm.action.SendString("~") },
}
-- Finally, return the configuration to wezterm:
return config
