# Abhijit's DotFiles.

## Migrating from `$HOME/.dotfiles`

`stow` of the 'system' package links to files in /etc,
this can break if the /home/ is on a separate directory.

To fix that, we now assume that `dotfiles` lives in /etc/.

To migrate config from $HOME,

1. Unlink all packages by adding -D to stow command line in the Makefile
2. move `.dotfiles` to `/etc/dotfiles`
3. remove the -D option from the makefile.
4. `make` to stow the packages again.

## Usage

1. have GNU stow installed.
2. clone this repo to `/etc/dotfiles`
3. make

## Go version

The Go toolchain version used by `.bashrc`, `build-k8s` and `update-gotools`
is resolved per script from (first hit wins):

1. a locally hardcoded override variable at the top of the script (empty by default)
2. `~/.config/go-version` if it exists (stowed from `config/`)
3. a built-in fallback of `1.26`

The version is the bare directory suffix, e.g. `1.26` for `/usr/lib/go-1.26`.
To bump the default, edit `config/.config/go-version`, run `make`, and commit.
