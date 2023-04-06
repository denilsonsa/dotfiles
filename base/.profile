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
# Remember to run this once:
#npm config set prefix "${NPM_PACKAGES}"
# Which creates a file ~/.npmrc
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="${NPM_PACKAGES}/bin:${PATH}"
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath -q)"

# Go uses ~/go/ by default
# https://golang.org/cmd/go/#hdr-GOPATH_environment_variable
# I only need this variable if I want to customize it.
#export GOPATH=${HOME}/go

# Some nice tools:
# https://github.com/ricardobeat/git-commands
export PATH="${HOME}/stuff/git-commands:${PATH}"

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/go/bin:${PATH}"

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
eval "$(dircolors -b ~/.dir_colors)"

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


# `broot` is supposed to be called from a shell alias `br` in order to provide
# `cd` functionality.
# https://dystroy.org/broot/install
[ -f "${HOME}/.config/broot/launcher/bash/br" ] && . "${HOME}/.config/broot/launcher/bash/br"


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
