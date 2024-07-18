--------------------------------------------------------------------------------
---                           Wezterm User Config                            ---
--------------------------------------------------------------------------------

-- Import Configuration Helpers --
local wezterm = require 'wezterm'
local common  = require 'helpers.common'

-- Build Configuration --
local config = wezterm.config_builder()
common.apply_to_config(config)

config.tab_bar_at_bottom = true

return config
