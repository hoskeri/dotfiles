# Abhijit's DotFiles.

## Migrating in $HOME/.dotfiles

stow of the 'system' package links to files in /etc,
this can break if the /home/ is on a separate directory.

To fix that, we now assume that dotfiles lives in /etc/

To migrate the config,

1. unstow all packages using add adding -D to stow command line in the Makefile
2. move .dotfiles to /etc/dotfiles
3. remove the -D option from the makefile.
4. make to stow the packages again.

## Usage

1. have GNU stow installed.
2. clone this repro to /etc/dotfiles
3. make
