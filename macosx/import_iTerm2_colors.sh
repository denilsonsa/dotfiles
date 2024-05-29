#!/bin/sh

# Abort this script if iTerm2 wasn't detected.
test -f ~/Library/Preferences/com.googlecode.iterm2.plist || exit
# Abort this script if the color preset was already imported.
grep -q Breath ~/Library/Preferences/com.googlecode.iterm2.plist && exit
# Open this file, which will automatically import it into iTerm2.
open macosx/Breath_Silverfox.itermcolors

# This itermcolors file was generated from https://github.com/Gogh-Co/Gogh
# By editing https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh
# removing the `rm` call from the `apply_darwin()` function.
