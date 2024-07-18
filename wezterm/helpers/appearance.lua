--------------------------------------------------------------------------------
---                            Wezterm Appearance                            ---
--------------------------------------------------------------------------------

local wezterm = require 'wezterm'

local module = {}
function module.apply_to_config(config)
  -- Fonts & Texts
  config.font_size = 10
  config.adjust_window_size_when_changing_font_size = false

  -- Cursor Style
  config.default_cursor_style = 'BlinkingBar'
  config.cursor_blink_rate    = 1080
  config.animation_fps        = 30

  -- Window Style
  config.use_fancy_tab_bar            = false
  config.hide_tab_bar_if_only_one_tab = true

  -- Themes & Colors
  config.color_scheme = 'Catppuccin Macchiato' -- It's honestly close enough
  config.colors       = {
    cursor_border = '#F5C2E7',
    cursor_bg     = '#F5C2E7', -- Necessary per issue 1494
    -- foreground    = '#BDC2CC',
    -- background    = '#181A21',
    -- selection_fg  = '#181A21',
    -- selection_bg  = '#54A5DC',
    -- ansi          = {
    --   '#4F525A', '#E55846', '#72A76C', '#FBFE0D',
    --   '#54A5DC', '#DC7D36', '#8AD8EE', '#BDC2CC'
    -- },
    -- brights       = {
    --   '#6A6E77', '#E27367', '#86B285', '#F4F839',
    --   '#6EB0DF', '#DB905A', '#9AD9ED', '#D8DEE9'
    -- },
    tab_bar       = {
      background = '#363A4F',
      active_tab = {
        fg_color  = '#B8C0E0',
        bg_color  = '#24273A',
    --     italic    = true
      },
      inactive_tab = {
        fg_color = '#A5ADCB',
        bg_color = '#363A4F'
      },
      inactive_tab_hover = {
        fg_color = '#B8C0E0',
        bg_color = '#24273A'
      },
      new_tab = {
        fg_color = '#A5ADCB',
        bg_color = '#363A4F'
      },
      new_tab_hover = {
        fg_color  = '#B8C0E0',
        bg_color  = '#363A4F'
      }
    },
    -- WezTerm Pane Colors
    split = '#C6A0F6',
    -- Other WezTerm Colors
    compose_cursor = '#A6DA95'
  }
end

return module
