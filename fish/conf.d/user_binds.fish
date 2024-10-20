################################################################################
###                          User Fish Keybindings                           ###
################################################################################

# \c is control
# \e is escape/meta/alt

bind \cw  delete-or-exit
bind \cd  backward-kill-path-component
bind \cf  'neofetch; fish_greeting; echo; commandline -f repaint'
bind \eL  'commandline -f kill-whole-line; pwd; la; echo; commandline -f repaint'
bind \t   forward-word or complete

# Alt + Backspace
bind \e\x7F 'backward-kill-line'

# Control + Backspace (No Control + Shift + Backspace...) -- NOT COMMON WITH SUBLIME
bind \b 'backward-kill-word'

# Alt + Delete
bind \e\[3\;3~ 'kill-line'

# Alt + Shift + Delete
bind \e\[3\;4~ ''

# Control + Delete
bind \e\[3\;5~ 'kill-word'

# Control + Shift + Delete
bind \e\[3\;6~ ''
