My own "dotfiles", or configuration files.

## Quick setup

Upon getting to a new machine, I repeat these steps:

```bash
mkdir ~/dotfiles
cd ~/dotfiles

# Do I want to have push/write access to update the dotfiles?
git clone git@github.com:denilsonsa/dotfiles.git
# Do I want a read-only copy of the dotfiles?
git clone https://github.com/denilsonsa/dotfiles.git

./install
```

It is desirable to set SSH before setting up the dotfiles. SSH is required when cloning the repository with read/write support. Due to the sensitive nature and due to the strict permissions required on `~/.ssh/`, there is no SSH configuration stored in this repository.

### Hard-coded paths

There are a few hard-coded paths in `.gitconfig`:

* `~/dotfiles/`, and that's why this repository should be cloned there.
* `~/myrepos/`, which should contain clones of any other personal repository.

## Local customization outside dotfiles

There are some configurations that should not be stored in dotfiles. Thus, the following files are sourced as well:

* `~/.bash-local` for bash.
* `~/.zsh-local` for zsh.
* `~/.profile-local` for both bash and zsh.
* `~/.gitconfig-local` for git.
* `~/.vim/vimrc-local` for vim, should be based on the example in this repository.

## See also

* https://dotfiles.github.io/
* http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
* https://github.com/anishathalye/dotbot
* https://github.com/anishathalye/dotbot/pull/11#issuecomment-73082152
* https://github.com/rubenvereecken/dotbot-apt-get
