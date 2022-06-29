# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
	. "${HOME}/.bashrc"
    fi
fi

shopt -s histappend
HISTSIZE=5000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Import the env vars set in this file.
# This file is loaded in both bash and zsh.
# https://superuser.com/q/187639
. "${HOME}/.profile"

# Import bash-specific functions.
. "${HOME}/.bash_convenience_functions"

# Import work-specific code, stuff specific for the company I'm working for.
[ -f "{$HOME}/.bash_company_stuff" ] && . "${HOME}/.bash_company_stuff"
