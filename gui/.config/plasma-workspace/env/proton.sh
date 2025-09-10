#!/bin/sh

# Having `wine` in $PATH causes the itch.io desktop client to allow downloading Windows-only games.
# https://itch.io/t/694459/please-allow-installing-windows-versions-under-linux
# https://itch.io/post/7913727

PROTON="/home/deck/.local/share/Steam/steamapps/common/Proton - Experimental/files/bin"
if [ -d "$PROTON" ] ; then
	export PATH="$PATH:$PROTON"
fi

# For some reason, this didn't work:
#
# PROTON="$HOME/.local/share/Steam/steamapps/common/Proton - Experimental/files/bin"
# if [ "$USER" = "deck" ] ; then
# 	export PATH="$PATH:$PROTON"
# fi
