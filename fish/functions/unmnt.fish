function unmnt
  set -f devdir /(string replace -a . / $argv)
  sudo umount $devdir && sudo rmdir /media/(whoami)/$argv
end
