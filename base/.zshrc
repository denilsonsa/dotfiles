# This has to be set before loading ohmyzsh.
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if [ -d "${HOME}/.homebrew" ] ; then
	# Non-root installation of Homebrew on Mac OS X:
	FPATH="${HOME}/.homebrew/share/zsh/site-functions:${FPATH}"
elif type brew &> /dev/null ; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

export ZSH="${HOME}/dotfiles/ohmyzsh"
if [ -d "${ZSH}" ] ; then
	# The following was copied from:
	# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

	# Set name of the theme to load --- if set to "random", it will
	# load a random theme each time oh-my-zsh is loaded, in which case,
	# to know which specific one was loaded, run: echo $RANDOM_THEME
	# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
	#ZSH_THEME="agnoster"
	#ZSH_THEME="robbyrussell"

	# Set list of themes to pick from when loading at random
	# Setting this variable when ZSH_THEME=random will cause zsh to load
	# a theme from this variable instead of looking in $ZSH/themes/
	# If set to an empty array, this variable will have no effect.
	# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

	# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

	# Uncomment the following line to use hyphen-insensitive completion.
	# Case-sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

	# Uncomment one of the following lines to change the auto-update behavior
	# zstyle ':omz:update' mode disabled  # disable automatic updates
	# zstyle ':omz:update' mode auto      # update automatically without asking
	# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

	# Uncomment the following line to change how often to auto-update (in days).
	# zstyle ':omz:update' frequency 13

	# Uncomment the following line if pasting URLs and other text is messed up.
	# DISABLE_MAGIC_FUNCTIONS="true"

	# Uncomment the following line to disable colors in ls.
	# denilson disabled this because I have my own LS color setup in this dotfiles.
	DISABLE_LS_COLORS="true"

	# Uncomment the following line to disable auto-setting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	# ENABLE_CORRECTION="true"

	# Uncomment the following line to display red dots whilst waiting for completion.
	# You can also set it to another string to have that shown instead of the default red dots.
	# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
	# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
	COMPLETION_WAITING_DOTS="true"

	# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
	# much, much faster.
	# DISABLE_UNTRACKED_FILES_DIRTY="true"

	# Uncomment the following line if you want to change the command execution time
	# stamp shown in the history command output.
	# You can set one of the optional three formats:
	# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	# or set a custom format using the strftime function format specifications,
	# see 'man strftime' for details.
	# HIST_STAMPS="mm/dd/yyyy"
	# HIST_STAMPS="yyyy-mm-dd"

	# Would you like to use another custom folder than $ZSH/custom?
	# ZSH_CUSTOM=/path/to/new-custom-folder

	# Timer plugin: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/timer
	# The `timer` plugin is bad, because it overwrites the last few characters from the last line, potentially overwriting important characters that I wish to read (or copy).
	# TIMER_PRECISION=1
	# TIMER_FORMAT='/%d'
	# TIMER_THRESHOLD=0

	# Which plugins would you like to load?
	# Standard plugins can be found in $ZSH/plugins/
	# Custom plugins may be added to $ZSH_CUSTOM/plugins/
	# Example format: plugins=(rails git textmate ruby lighthouse)
	# Add wisely, as too many plugins slow down shell startup.
	plugins=(git-prompt z)
	# Other interesting plugins:
	# - battery
	# - bgnotify
	# - emoji-clock (interesting idea, but the glyphs are hard to read)

	source $ZSH/oh-my-zsh.sh
else
	unset ZSH

	# Use powerline
	USE_POWERLINE="true"
	# Source manjaro-zsh-configuration
	# https://github.com/Chrysostomus/manjaro-zsh-config
	if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
		source /usr/share/zsh/manjaro-zsh-config

		# Removing stupid aliases from Manjaro:
		unalias cp    # cp -i
		unalias df    # df -h
		unalias free  # free -m
		unalias gitu  # git add . && git commit && git push
	fi
fi

# Use manjaro zsh prompt
if false && [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
	source /usr/share/zsh/manjaro-zsh-prompt
	# Manjaro uses powerlevel9k/powerlevel10k
	# https://github.com/romkatv/powerlevel10k
	# It might be worth using it as a prompt instead of plain oh-my-zsh.
	# But its configuration file is giant, almost 2000 lines.
else
	# Learn more: `man zshmisc` and search for `EXPANSION OF PROMPT SEQUENCES`
	#
	# Quick summary of useful escapes:
	# %m        hostname (up to the first `.`)
	# %n        $USERNAME
	# %#        either `#` if root privileges, or `%`
	# $?        exit code of the last command
	# %d or %/  $PWD, can have an integer to specify the amount of trailing components
	# %~        $PWD, but replacing $HOME with ~
	# %j        number of jobs
	# %T        current time of the day, 24h format
	# %*        current time of the day, 24h format, with seconds
	# $D{...}   strftime formatted string
	# %E        clear to the end of line
	#
	# Upper-case starts, lower-case stops:
	# %B  %b  bold
	# %U  %u  underline
	# %S  %s  standout
	# %F  %f  foreground color
	# %K  %k  bacKground color
	#
	# Conditionals:
	# %n(x.true.false)
	#   n is an optional positive integer, defaults to zero
	#   x is the test character (about 20 possible characters)
	#   . is any separator character
	#   true and false are the strings to be printed

	# Some interesting functions:
	# -  $(battery_pct_prompt) from `battery` plugin
	# -  $(emoji-clock) from `emoji-clock` plugin

	# Two very basic prompts by default:
	# With username@hostname:
	#PS1='%F{green}[%n@%m%F{gray} %1~%F{green}] %#%f '
	# Without hostname, just username:
	PS1='%F{green}[%n%F{gray} %1~%F{green}] %#%f '

	# Right prompt, which is set by the `git-prompt` plugin:
	# RPROMPT='$(git_super_status)'

	# Machine-specific prompts:
	if [ "$(uname -s)" = "Darwin" ] ; then
		# Colors for my work laptop:
		PS1='%F{231}%k🯩%F{61}%K{231} %n %F{231}%K{202} %1~ %F{202}%k🯫%(?||%F{9}%?⏎)%(#|%F{202}%#|)%f '
		# Simpler version without Unicode glyphs:
		#PS1='%F{61}%K{231} %n %F{231}%K{202} %1~ %k%(?|| %F{9}%? )%F{202}%#%f '
	elif [ "$USER" = "deck" ] ; then
		# Steam Deck
		# The Hack font doesn't have `🯫`, so I'm using `🭬` instead.
		# The "Cascadia Mono" font includes everything.
		# https://devblogs.microsoft.com/commandline/cascadia-code-2404-23/
		# Fake Steam Deck logo using `●` and either `)` or `❫`.
		PS1='%F{68}%K{234}●%F{15}%B❫%b%F{68}%n%F{234}%K{15}🭬%F{234}%1~%F{15}%k🭬%(?||%F{9}%?⏎)%(#|%F{68}%#|)%f '
	elif [ "$USER" = "denilson" ] ; then
		if [ "$HOST" = "hpelitedesk800g2" ] ; then
			# By having "Cascadia" installed, I can have all those fancy glyphs
			# from "Symbols for Legacy Computing" on any font.
			# (Because the system gets missing glyphs from other fonts.)
			PS1='%F{30}%k🯩%F{15}%K{30} 🖳  %F{30}%K{15} %B%~%b %F{15}%k🯫%(?||%F{9}%?⏎)%(#|%F{30}%#|)%f '
		else
			PS1='%F{40}%K{237}%m%F{237}%K{40}🭬%F{232}%~%F{40}%k🭬%(?||%F{9}%?⏎)%(#|%F{30}%#|)%f '
		fi
	fi
fi

# Import the env vars set in this file.
# This file is loaded in both bash and zsh.
# https://superuser.com/q/187639
. "${HOME}/.profile"

# thefuck works by looking at the most recent history entry.
# It won't work if I keep prefixing my commands with space.
#command -v thefuck &> /dev/null && eval $(thefuck --alias)

[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && . "${HOME}/.iterm2_shell_integration.zsh"

# Import shell configuration specific for the current machine, not saved in the dotfiles repository.
[ -f "${HOME}/.profile-local" ] && . "${HOME}/.profile-local"
[ -f "${HOME}/.zsh-local" ] && . "${HOME}/.zsh-local"

# Make sure the last command returns success.
# Otherwise the first shell prompt will already display the error code (exit code) from the last command.
true
