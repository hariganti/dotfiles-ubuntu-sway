--------------------------------------------------------------------------------
---                            Wezterm Keybindings                           ---
--------------------------------------------------------------------------------

local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  local act   = wezterm.action
  local atab  = act.ActivateTab
  local apane = act.ActivatePaneByIndex
  config.keys =
  {
    { -- Alt+Enter | No action (no fullscreen)
      key     = 'Enter',
      mods    = 'ALT',
      action  = act.Nop
    },
    { -- F11 | Fullscreen
      key     = 'F11',
      action  = act.ToggleFullScreen
    },
    { -- Ctrl+Shift+\ | Split pane left/right
      key     = '|',
      mods    = 'CTRL|SHIFT',
      action  = act.SplitHorizontal{domain = 'DefaultDomain'}
    },
    { -- Ctrl+Shift+- | Split pane top/bottom
      key     = '_',
      mods    = 'CTRL|SHIFT',
      action  = act.SplitVertical{domain = 'DefaultDomain'}
    },
    { -- Ctrl+Shift+w | Close current pane (or tab, if last [or window, if last])
      key     = 'w',
      mods    = 'CTRL|SHIFT',
      action  = act.CloseCurrentPane{confirm = true},
    },
    { -- Ctrl+Shift+q | Close window
      key     = 'q',
      mods    = 'CTRL|SHIFT',
      action  = act.QuitApplication,
    },
    { -- Ctrl+Alt+t | Show tab navigator
      key     = 't',
      mods    = 'CTRL|ALT',
      action  = act.ShowTabNavigator,
    },
    { -- Shift+Page Up | No action (no page up)
      key     = 'PageUp',
      mods    = 'SHIFT',
      action  = act.Nop,
    },
    { -- Ctrl+Page Up | Page up
      key     = 'PageUp',
      mods    = 'CTRL',
      action  = act.ScrollByPage(-1),
    },
    { -- Shift+Page Down | No action (no page down)
      key     = 'PageDown',
      mods    = 'SHIFT',
      action  = act.Nop,
    },
    { -- Ctrl+Page Down | Page down
      key     = 'PageDown',
      mods    = 'CTRL',
      action  = act.ScrollByPage(1),
    },
    { -- Ctrl+Up | Scroll up 1 line
      key     = 'UpArrow',
      mods    = 'CTRL',
      action  = act.ScrollByLine(-1),
    },
    { -- Ctrl+Down | Scroll down 1 line
      key     = 'DownArrow',
      mods    = 'CTRL',
      action  = act.ScrollByLine(1),
    },
    { -- Ctrl+Home | Scroll to top
      key     = 'Home',
      mods    = 'CTRL',
      action  = act.ScrollToTop,
    },
    { -- Ctrl+End | Scroll to bottom
      key     = 'End',
      mods    = 'CTRL',
      action  = act.ScrollToBottom,
    },
  }

  for i = 1, 9 do
    table.insert
    (
      config.keys,
      { -- Alt+# | Activate selected tab
        key     = tostring(i),
        mods    = 'ALT',
        action  = atab(i - 1)
      }
    )
    table.insert
    (
      config.keys,
      { -- Ctrl+# | Activate selected pane
        key     = tostring(i),
        mods    = 'CTRL',
        action  = apane(i - 1)
      }
    )
  end

  -- Handle special cases of above
  table.insert
  (
    config.keys,
    {
      key     = '0',
      mods    = 'ALT',
      action  = atab(9)
    }
  )
  table.insert
  (
    config.keys,
    {
      key     = '0',
      mods    = 'CTRL',
      action  = apane(9)
    }
  )
end

return module
