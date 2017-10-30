.DEFAULT_GOAL := help


deploy: ## Deploy this dotfiles
	ln -vsf ${PWD}/.aliases ${HOME}/.aliases
	ln -vsf ${PWD}/.bash_profile ${HOME}/.bash_profile
	ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	# ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.gitignore ${HOME}/.gitignore
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.zshenv ${HOME}/.zshenv
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/tmux/.tmux.conf.cygwin ${HOME}/.tmux.conf.cygwin
	ln -vsf ${PWD}/tmux/.tmux.conf.osx ${HOME}/.tmux.conf.osx

update: ## Pulling from repo
	git pull origin master

install: update deploy ## Run make update, deploy
	@exec $$SHELL


# `sort`     : When sort is deleted, the target are sorted in the order that they appear in the makefile, not in alphabetical order.
# `36m%-XXs` : Number of `XX` is space width can be adjusted.
.PHONY: help
help: ## Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

