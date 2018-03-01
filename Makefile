STOW := /usr/bin/stow --no-folding
all:
	@$(STOW) utils
	@$(STOW) vim
	@$(STOW) tmux
	@$(STOW) emacs
	@$(STOW) sbt
	@$(STOW) git
	@$(STOW) bash
	@$(STOW) mail
	@$(STOW) dropbox
	@sudo $(STOW) -t / system
