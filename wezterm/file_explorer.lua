--------------------------------------------------------------------------------
---                           Wezterm User Config                            ---
--------------------------------------------------------------------------------

-- Import Configuration Helpers --
local wezterm = require 'wezterm'
local common  = require 'helpers.common'

-- Common Configuration --
local config = wezterm.config_builder()
common.apply_to_config(config)

-- Specific Configuration --
config.window_background_opacity = 0.70

return config
