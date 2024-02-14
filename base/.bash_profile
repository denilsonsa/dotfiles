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

# Import the env vars set in this file.
# This file is loaded in both bash and zsh.
# https://superuser.com/q/187639
. "${HOME}/.profile"

# Import bash-specific functions.
. "${HOME}/.bash_convenience_functions"

# thefuck works by looking at the most recent history entry.
# It won't work if I keep prefixing my commands with space.
#command -v thefuck &> /dev/null && eval $(thefuck --alias)

# Import shell configuration specific for the current machine, not saved in the dotfiles repository.
[ -f "{$HOME}/.profile-local" ] && . "${HOME}/.profile-local"
[ -f "{$HOME}/.bash-local" ] && . "${HOME}/.bash-local"
