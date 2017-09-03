deploy: # Deploy this dotfiles
		ln -vsf ${PWD}/.aliases ${HOME}/.aliases
		ln -vsf ${PWD}/.bash_profile ${HOME}/.bash_profile
		ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
		ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
		ln -vsf ${PWD}/.gitignore ${HOME}/.gitignore
		ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
		ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
		ln -vsf ${PWD}/.zshenv ${HOME}/.zshenv
		ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc

update: # Pulling from repo
		git pull origin master

install: update deploy # Run make update, deploy
		@exec $$SHELL
