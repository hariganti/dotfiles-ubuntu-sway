function __fish_list_current_token --description 'List contents of token under the cursor if it is a directory, otherwise list the contents of the current directory'
  set -l val (commandline -t | string replace -r '^~' "$HOME")
  printf "\n"
  if test -d $val
    gols $val
  else
    set -l dir (dirname -- $val)
    if test $dir != . -a -d $dir
      gols $dir
    else
      gols
    end
  end

  string repeat -N \n --count=(math (count (fish_prompt)) - 1)

  commandline -f repaint
end