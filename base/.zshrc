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

# Import work-specific code, stuff specific for the company I'm working for.
[ -f "${HOME}/.zsh_company_stuff" ] && . "${HOME}/.zsh_company_stuff"
