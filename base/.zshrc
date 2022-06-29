# Import the env vars set in this file.
# This file is loaded in both bash and zsh.
# https://superuser.com/q/187639
. "$HOME/.profile"

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Import work-specific code, stuff specific for the company I'm working for.
[ -f "${HOME}/.zsh_company_stuff" ] && . "${HOME}/.zsh_company_stuff"
