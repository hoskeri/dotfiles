STOW := /usr/bin/stow --no-folding -t $(HOME)
all:
	@$(STOW) utils
	@$(STOW) vim
	@$(STOW) tmux
	@$(STOW) sbt
	@$(STOW) git
	@$(STOW) bash
	@$(STOW) mail
	@$(STOW) dropbox
	@$(STOW) elm
	@$(STOW) gnupg
	@sudo -n $(STOW) -t / system

.PHONY: all
