function mnt
  set -f mntdir /media/(whoami)/(string replace -a / . (string sub -s 2 $argv))
  sudo mkdir -p $mntdir && sudo mount $argv $mntdir
end
