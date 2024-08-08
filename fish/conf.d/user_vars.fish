################################################################################
###                           User Fish Variables                            ###
################################################################################

# Set fzf.fish defaults
set -l rhs_preview          '--preview-window=right,85'
set -l bot_preview          '--preview-window=bottom,2,wrap'
set -x fzf_prompt_icon      '❯ '
set -x fzf_preview_file_cmd 'fzf-preview.sh'
# set -x fzf_preview_dir_cmd  'gols' # Not quite ready...
set -x fzf_git_status_opts  $rhs_preview
set -x fzf_git_log_opts     $rhs_preview
set -x fzf_directory_opts   $rhs_preview
set -x fzf_variable_opts    $rhs_preview
set -x fzf_history_opts     $rhs_preview',hidden'
set -x fzf_process_opts     $bot_preview

# Set fzf defaults
set -x FZF_DEFAULT_COMMAND  'fdfind'
set -x FZF_DEFAULT_OPTS     '--cycle --border --layout=reverse --height=89% --marker="*" --info=right --bind=ctrl-p:toggle-preview'

# Set man pages to use batcat for paging (and coloring!)
set -x MANPAGER   'sh -c "col -bx | batcat -l man -p"'
set -x MANROFFOPT '-c'

# Set micro truecolor
set -x MICRO_TRUECOLOR 1
