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
is resolved by `go-version` (in `~/bin`), in this order (first hit wins):

1. `$GO_VERSION` - per-invocation override, e.g. `GO_VERSION=1.25 build-k8s`
2. `.go-version` in the current directory or any parent - per-project pin
3. `~/.config/go-version` - the machine default (stowed from `config/`)

The version is the bare directory suffix, e.g. `1.26` for `/usr/lib/go-1.26`.
To bump the default, edit `config/go-version`, run `make`, and commit.
