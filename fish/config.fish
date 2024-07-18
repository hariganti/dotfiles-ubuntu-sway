################################################################################
###                            User Fish Config                              ###
################################################################################

# Most configuration is handled by helpers under ~/.config/fish/conf.d/,
# including vars, keybindings, and abbreviations. Specific config items, such as
# adding items to the PATH, will be kept here

### Set PATH ###
fish_add_path ~/.local/bin

### Interactive-Shell-Specific Configs ###
if status is-interactive
  # Commands to run in interactive sessions can go here
end

### Login-Shell-Specific Configs ###
if status is-login
  # Commands to run in login sessions can go here
end