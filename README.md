My own "dotfiles", or configuration files.

## Quick setup

Upon getting to a new machine, I repeat these steps:

1. Set up ssh, if read-write access is desired.

    ```bash
    ssh-keygen
    # Or, if generating RSA keys:
    ssh-keygen -b 4096
    ```

2. [Add the public key to GitHub](https://github.com/settings/keys), if read-write access is desired:

    ```bash
    cat ~/.ssh/id_*.pub
    ```

3. Clone the dotfiles repository:

    ```bash
    cd ~/

    # Do I want to have push/write access to update the dotfiles?
    git clone git@github.com:denilsonsa/dotfiles.git
    # Do I want a read-only copy of the dotfiles?
    git clone https://github.com/denilsonsa/dotfiles.git

    cd ~/dotfiles
    ./install
    ```
4. Setup `~/.ssh/config` as desired.
    * Due to the sensitive nature and due to the strict permissions required on `~/.ssh/`, SSH configuration is not managed by this repository.
    * There is a basic template available: [ssh_slash_config-template](ssh_slash_config-template)

### Hard-coded paths

There are a few hard-coded paths in [base/.gitconfig](base/.gitconfig):

* `~/dotfiles/`, and that's why this repository should be cloned there.
* `~/myrepos/`, which should contain clones of any other personal repository.

There is one hard-coded path in [base/.zshrc](base/.zshrc):

* `~/dotfiles/`, and that's why this repository should be cloned there.

## Local customization outside dotfiles

There are some configurations that should not be stored in dotfiles. Thus, the following files are sourced as well:

* `~/.bash-local` for bash.
* `~/.zsh-local` for zsh.
* `~/.profile-local` for both bash and zsh.
* `~/.gitconfig-local` for git.
* `~/.vim/vimrc-local` for vim, should be based on the example in this repository.

## TODO

* [ ] Oh-my-zsh manual installation: <https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#manual-installation>
    * <https://gitlab.manjaro.org/packages/community/manjaro-zsh-config/-/blob/master/PKGBUILD>
    * <https://github.com/Chrysostomus/manjaro-zsh-config>
    * <https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh>
    * <https://gist.github.com/yovko/becf16eecd3a1f69a4e320a95689249e>
* [ ] Per-machine vim plugin configuration
    * coc and gutentags (ctags) should be disabled on the Steam Deck and on other systems.

## See also

* <https://dotfiles.github.io/>
* <http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/>
* <https://github.com/anishathalye/dotbot>
* <https://github.com/anishathalye/dotbot/pull/11#issuecomment-73082152>
* <https://github.com/rubenvereecken/dotbot-apt-get>
* <https://mitxela.com/projects/dotfiles_management>
