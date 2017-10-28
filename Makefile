all:
	@stow utils
	@stow vim
	@stow tmux
	@stow emacs
	@stow sbt
	@stow git
	@stow bash
	@stow mail
	@stow dropbox
	@sudo stow -t / system
