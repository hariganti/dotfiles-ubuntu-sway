################################################################################
###                                   yy                                     ###
################################################################################
# Fish script provided by the Yazi developers to set cwd to the active         #
# directory when exiting Yazi.                                                 #
# https://yazi-rs.github.io/docs/quick-start/#shell-wrapper                    #
################################################################################

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
