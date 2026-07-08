-- Pull in the wezterm API
local wezterm = require("wezterm")

local function get_appearance(window)
	local appearance = window:get_appearance()
	if appearance:find("Dark") then
		return "Tokyo Night" -- Replace with your preferred dark theme
	else
		return "Tokyo Night Day" -- Replace with your preferred light theme
	end
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local scheme = get_appearance(window)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- [[CONFIG]]
-- NOTE: This is where you actually apply your config choices.

--font
config.font_size = 14
config.font = wezterm.font("0xProto Nerd Font Mono")

--window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.debug_key_events = true

--theme

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
