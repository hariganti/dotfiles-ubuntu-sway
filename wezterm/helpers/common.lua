--------------------------------------------------------------------------------
---                          Wezterm Default Config                          ---
--------------------------------------------------------------------------------

-- Import Configuration Helpers
local module  = {}
local helpers = {
  (require 'helpers.keybindings'),
  (require 'helpers.appearance'),
  (require 'helpers.commands')
}

function module.apply_to_config(config)
  for _,v in pairs(helpers) do
    v.apply_to_config(config)
  end

  config.term                  = 'wezterm'
--  config.enable_kitty_keyboard = true
end

return module
