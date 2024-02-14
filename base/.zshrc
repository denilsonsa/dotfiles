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
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Import the env vars set in this file.
# This file is loaded in both bash and zsh.
# https://superuser.com/q/187639
. "$HOME/.profile"

# thefuck works by looking at the most recent history entry.
# It won't work if I keep prefixing my commands with space.
#command -v thefuck &> /dev/null && eval $(thefuck --alias)

# Import shell configuration specific for the current machine, not saved in the dotfiles repository.
[ -f "{$HOME}/.profile-local" ] && . "${HOME}/.profile-local"
[ -f "${HOME}/.zsh-local" ] && . "${HOME}/.zsh-local"
