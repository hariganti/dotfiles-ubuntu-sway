--------------------------------------------------------------------------------
---                          Wezterm Command Pallet                          ---
--------------------------------------------------------------------------------

local wezterm = require 'wezterm'

local module = {}
function module.apply_to_config(config)
  config.launch_menu = {
    {
      label = 'Open WezTerm configuration',
      args  = {os.getenv('VISUAL'), os.getenv('WEZTERM_CONFIG_FILE')}
    }
  }
end

return module