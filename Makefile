all:
	@stow utils
	@stow vim
	@stow tmux
	@stow emacs
	@stow sbt
	@stow gradle
	@stow git
	@sudo stow -t / system
