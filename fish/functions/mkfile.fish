################################################################################
###                                 mkfile                                   ###
################################################################################
# Fish script to create an arbitrary number of files in directories that may   #
# or may not exist. If the directories don't exist, they will be created.      #
# Existing files won't be modified, other than updating the access datetime.   #
# Full filenames (with paths) are echoed so they can be used subsequently, for #
# example:                                                                     #
#                                                                              #
#   subl (mkfile dir1/file1 dir2/file2 dir2/subdir1/file3)                     #
#                                                                              #
# Will create file1 in dir1, file2 in dir2, and file3 in dir2/subdir1 and open #
# all three files in Sublime Text                                              #
################################################################################
#                                Hari Ganti | 2024/06/12 | hariganti@gmail.com #
################################################################################

function mkfile
  if test (count $argv) -eq 0
    echo 'Usage is "mkfile <directory/.../filename> [<directory/.../filename> ...]"'
    return
  end

  for i in $argv
    set -l args (string split -r -m1 / $i)
    if test (count $args) -gt 1
      mkdir -p $args[1]
    end
    touch $i
    echo  (realpath $i)
  end
end
