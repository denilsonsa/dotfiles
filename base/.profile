# ~/.profile
#
# Be careful with the syntax.
# This file is being loaded by both bash and zsh.
#
# See also: .bash_convenience_functions

export EDITOR=vim
export VISUAL=vim
export GTK_OVERLAY_SCROLLING=0
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

# This makes the touchpad two-finger scrolling very smooth and natural.
# https://wiki.archlinux.org/title/Firefox/Tweaks#Pixel-perfect_trackpad_scrolling
# It also has the potential of improving touch/pen input.
# https://bugzilla.mozilla.org/show_bug.cgi?id=1606832
export MOZ_USE_XINPUT2=1

# Disable Wine logging to reduce noise and improve performance.
# https://wiki.winehq.org/Wine_User%27s_Guide#Environment_variables
export WINEDEBUG=-all
# Disable Wine trying to associate itself to files on my host desktop/OS.
# https://wiki.winehq.org/FAQ#How_can_I_prevent_Wine_from_changing_the_filetype_associations_on_my_system_or_adding_unwanted_menu_entries.2Fdesktop_links.3F
export WINEDLLOVERRIDES=winemenubuilder.exe=d
# There are two other variables:
# export WINEARCH=win32
# export WINEARCH=win64
# export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes"
# export WINEPREFIX="${HOME}/.local/share/wineprefixes"

# https://github.com/nvbn/thefuck#settings
#export THEFUCK_ALTER_HISTORY=false

# Custom Perl on my home directory.
# PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

# Java and/or IntelliJ refuses to work properly without this on my Ubuntu system.
#export JAVA_HOME="/usr/lib/jvm/default-java"

# Non-root NPM setup
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
# Any environment variables starting with `npm_config_` prefix are interpreted
# as configuration parameters.
export NPM_CONFIG_PREFIX="${HOME}/.npm-global-prefix"
export PATH="${PATH}:${NPM_CONFIG_PREFIX}/bin"
manpath -q &> /dev/null && export MANPATH="${NPM_PACKAGES}/share/man:$(manpath -q)"

# Go uses ~/go/ by default
# https://golang.org/cmd/go/#hdr-GOPATH_environment_variable
# I only need this variable if I want to customize it.
#export GOPATH=${HOME}/go

# Some nice tools:
# https://github.com/ricardobeat/git-commands
export PATH="${HOME}/otherrepos/git-commands:${PATH}"

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/go/bin:${PATH}"

# Non-root installation of Homebrew on Mac OS X:
export PATH="$PATH:$HOME/.homebrew/bin"

# Colored GCC warnings and errors
# https://stackoverflow.com/q/26070873
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Color-enabling aliases:
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Make cvlc automatically quit after playing everything, similar to mplayer.
alias cvlc='cvlc --play-and-exit'

# ls color rules:
#eval "$(dircolors -b ~/.dir_colors)"
#
# Note: dircolors is part of GNU coreutils, and thus isn't available by default
# on Mac OS X and BSD-based systems. You can install it with
# `brew install coreutils`
# and then execute HOMEBREW_ROOT/opt/coreutils/libexec/gnubin/dircolors
# https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found
#
# The most portable solution is to manually set the variable, and update this
# line from dotfiles whenever I change `~/.dir_colors`.
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.eps=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';

# ls date/time format can be: full-iso, long-iso, iso, locale, +FORMAT.
# * full-iso includes fractions of seconds and the timezone. It's too verbose.
# * long-iso is the best: YYYY-MM-DD HH:MM
# * iso sometimes shows just the date (YYYY-MM-DD) but sometimes a partial datetime without the year (MM-DD HH:MM). Ugh.
# * locale seems to be the default.
export TIME_STYLE=long-iso

# Do you want even more colors? See:
# * https://github.com/Efreak/awesome-colorterm
# * https://github.com/garabik/grc
#     * https://github.com/garabik/grc/blob/master/grc.zsh
# * https://wiki.archlinux.org/title/Color_output_in_console

# My own ls aliases:
alias la='ls -A'
alias lc='ls -crAsh'
alias ll='ls -ltrA'
alias lss='ls -sSrAh'

# Debian installs `fd` as `fdfind`:
# https://packages.debian.org/sid/amd64/fd-find/filelist
# https://github.com/sharkdp/fd?tab=readme-ov-file#on-ubuntu
[ -x "/usr/bin/fdfind" ] && alias fd='fdfind'

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert Your message here
alert() {
	# Single-line version. Very simple, but it swallows the $? value.
	#notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$*"

	# More complex version, should run fine in bash and zsh.
	# Preserves the $? value.
	local exitcode=$?
	notify-send --urgency=low -i "$([ $exitcode = 0 ] && echo terminal || echo error)" "$*"
	return $exitcode

	# Originally inspired by the following alias:
	# (that requires `history` and doesn't accept parameters)
	#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
}


# Prints a text-based table of multiple color combinations.
# Modified from Manjaro's .bashrc
# See also: https://github.com/funcoeszz/funcoeszz/blob/master/zz/zzcores.sh
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	for fgc in '' {30..37}; do
		for bold in '' ';1'; do
			for bgc in '' {40..47}; do
				vals="${fgc};${bgc}"
				vals="${vals##;}" # Removing prefix ;
				vals="${vals%%;}" # Removing suffix ;
				vals="${vals}${bold}"
				vals="${vals##;}" # Removing prefix ;

				seq0="\e[${vals}m"

				printf " ${seq0}%-11s\e[m" "${seq0}"
			done
			echo
		done
	done
}


# `broot` is supposed to be called from a shell alias `br` in order to provide
# `cd` functionality.
# https://dystroy.org/broot/install
[ -f "${HOME}/.config/broot/launcher/bash/br" ] && . "${HOME}/.config/broot/launcher/bash/br"

# `bat` is renamed to `batcat` on Debian.
[ -f "/usr/bin/batcat" -a ! -f "/usr/bin/bar" ] && alias bat='batcat'


# Needed on old Ubuntu/Debian.
# https://beyondgrep.com/install/
#alias ack='ack-grep'

# Safer aliases. Kind of.
# However, that can train the user to expect "-i" to always be
# set, which can be dangerous when the user runs those commands on a different
# server/machine/environment.
# Don't ask me how I learned this, but you can imagine it.
#alias cp="cp -i"
#alias mv="mv -i"
#alias rm="rm -i"

# No idea why I would need one of these:
# export QT_SELECT=4
# export QT_SELECT=5
