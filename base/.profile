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

# Better fzf (Fuzzy Finder)
# https://github.com/junegunn/fzf#tips
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

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
#export PATH="$PATH:${HOME}/.homebrew/bin"
export PATH="${HOME}/.homebrew/bin:$PATH"

# Color-enabling aliases:
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias ncdu='ncdu --color dark'

# Make cvlc automatically quit after playing everything, similar to mplayer.
alias cvlc='cvlc --play-and-exit'

# Colored GCC warnings and errors
# https://stackoverflow.com/q/26070873
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# iTerm.app (iTerm2) on Mac OS X sets this variable automatically,
# but the built-in Terminal app doesn't. If this variable is not set,
# Mac's `ls` command doesn't use colors.
export COLORTERM=truecolor

if which dircolors &> /dev/null ; then
	# ls color rules:
	eval "$(dircolors -b ~/.dir_colors)"
	#
	# Note: dircolors is part of GNU coreutils, and thus isn't available by
	# default on Mac OS X and BSD-based systems. The LS_COLORS variable is only
	# available on GNU ls anyway, Mac's ls uses LSCOLORS with a different
	# syntax.
	#
	# If you really want, you can install coreutils with
	# `brew install coreutils`
	# and then execute HOMEBREW_ROOT/opt/coreutils/libexec/gnubin/dircolors
	# https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found
	# https://superuser.com/questions/772922/how-to-change-the-colors-of-ls-output-terminal-on-mac-osx
elif [ -x "${HOME}/.homebrew/opt/coreutils/libexec/gnubin/dircolors" ] ; then
	eval "$("${HOME}/.homebrew/opt/coreutils/libexec/gnubin/dircolors" -b ~/.dir_colors)"
fi

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

# Mac OS X `ls` is more limited, and can't even display the file sizes.
# Let me use GNU `ls` whenever possible.
[ -x "${HOME}/.homebrew/opt/coreutils/libexec/gnubin/ls" ] && alias ls="${HOME}/.homebrew/opt/coreutils/libexec/gnubin/ls --color=auto"

# My own ls aliases:
alias la='ls -A'
alias lc='ls -crAsh'
alias ll='ls -ltrA'
alias lss='ls -sSrAh'

if [ -n "$ITERM_SESSION_ID" ] ; then
	# Use "sixels" as default on iTerm2.
	# Using "iterm" is heavier and requires a confirmation.
	alias chafa='chafa -f sixels'
	# Or we can use "symbols", because it's widely supported anyway.
fi

# ssh-agent-setup() {
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_rsa
# }

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

	printf "\n"
	printf "256-color escape codes are:\n"
	printf " %s for foreground\n" '\e[38;5;${value}m'
	printf " %s for background\n" '\e[48;5;${value}m'
	printf "The delimiter was supposed to be ':', but ';' is commonly supported.\n"
	printf "\n"

	for code in {0..255}; do
		printf "\e[48;5;%dm%3d\e[m" "${code}" "${code}"
		case "${code}" in
			7) printf "\n" ;;
			15|231|255) printf "\n\n" ;;

			#21|57|93|129|165|201) printf "\n" ;;
			#27|63|99|135|171|207) printf "\n" ;;
			#33|69|105|141|177|213) printf "\n" ;;
			#39|75|111|147|183|219) printf "\n" ;;
			#45|81|117|153|189|225) printf "\n" ;;
			51|87|123|159|195|231) printf "\n" ;;
		esac
	done

	printf "24-bit color escape codes are:\n"
	printf " %s for foreground\n" '\e[38;2;${r};${g};${b}m'
	printf " %s for background\n" '\e[48;2;${r};${g};${b}m'
	printf "\n"
	printf "Of course, they can be combined: %s\n" '\e[38;2;${r};${g};${b};48;2;${r};${g};${b}m'
	printf "Support for these is listed at: https://github.com/termstandard/colors\n"
	printf "\n"
}


# `bat` is renamed to `batcat` on Debian.
[ -f "/usr/bin/batcat" -a ! -f "/usr/bin/bat" ] && alias bat='batcat'

# `broot` is supposed to be called from a shell alias `br` in order to provide
# `cd` functionality.
# https://dystroy.org/broot/install
[ -f "${HOME}/.config/broot/launcher/bash/br" ] && . "${HOME}/.config/broot/launcher/bash/br"

# Debian installs `fd` as `fdfind`:
# https://packages.debian.org/sid/amd64/fd-find/filelist
# https://github.com/sharkdp/fd?tab=readme-ov-file#on-ubuntu
[ -x "/usr/bin/fdfind" ] && alias fd='fdfind'

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
