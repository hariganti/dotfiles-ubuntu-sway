################################################################################
###                           User Fish Variables                            ###
################################################################################

# Set man pages to use batcat for paging (and coloring!)
set -x MANPAGER   'sh -c "col -bx | batcat -l man -p"'
set -x MANROFFOPT -c

# Set fzf.fish defaults
set -l rhs_preview          right,85
set -l bot_preview          bottom,2,wrap
set -x fzf_prompt_icon      ❯ 
set -x fzf_preview_file_cmd fzf-preview.sh
set -x fzf_preview_dir_cmd  tree -L 2
set -x fzf_git_status_opts  --preview-window=$rhs_preview
set -x fzf_git_log_opts     --preview-window=$rhs_preview
set -x fzf_directory_opts   --preview-window=$rhs_preview
set -x fzf_variable_opts    --preview-window=$rhs_preview
set -x fzf_history_opts     --preview-window=$bot_preview
set -x fzf_process_opts     --preview-window=$bot_preview

# Set fzf defaults
set -l preview_label 'F1: Preview | F2: Stat | F3: Toggle Wrap | F4: Rezize'
set -x FZF_DEFAULT_COMMAND fdfind --color=always
set -x FZF_DEFAULT_OPTS                       \
  --ansi                                      \
  --cycle                                     \
  --multi                                     \
  --border                                    \
  --info=right                                \
  --height=89%                                \
  --marker=⋅                                  \
  --layout=reverse                            \
  --preview-label=\"$preview_label\"          \
  --preview-label-pos=-3:bottom               \
  --bind="backward-eof:abort"                 \
  --bind='"alt-up:preview-up"'                \
  --bind='"alt-down:preview-down"'            \
  --bind='"F1:preview(_fzf_preview_file {})"' \
  --bind='"F2:preview(stat {})"'              \
  --bind='"F3:toggle-preview-wrap"'           \
  --bind='"F4:change-preview-window(80%|hidden|)"' # TODO: Move into individual FZF viewers for better applicability to each type
  # TODO: Implement "reload" command in individual viewers for
    # F5 to refresh and F6 to show hidden files?
