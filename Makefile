all: clean pre
	@if [ ! -d ~/.dotfiles ]; then\
	 	exit 1\
	fi
	ln -s ${HOME}/.dotfiles/bashrc ${HOME}/.bashrc
	ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
	ln -s ${HOME}/.dotfiles/ctfrc ${HOME}/.ctfrc
	ln -s ${HOME}/.dotfiles/gdbinit ${HOME}/.gdbinit
	ln -s ${HOME}/.dotfiles/gef.rc ${HOME}/.gef.rc
	ln -s ${HOME}/.dotfiles/gef-scripts ${HOME}/.gef-scripts
	ln -s ${HOME}/.dotfiles/gitconfig ${HOME}/.gitconfig
	ln -s ${HOME}/.dotfiles/inputrc ${HOME}/.inputrc
	ln -s ${HOME}/.dotfiles/pythonrc ${HOME}/.pythonrc
	ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
	mkdir -p ${HOME}/.idapro/
	ln -s ${HOME}/.dotfiles/idauser.cfg ${HOME}/.idapro/idauser.cfg
	ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.vim/undo
	ln -s ${HOME}/.dotfiles/vim-snippets ${HOME}/.vim/snippets

clean:
	rm -rf ${HOME}/.bashrc
	rm -rf ${HOME}/.ctfrc
	rm -rf ${HOME}/.gdbinit
	rm -rf ${HOME}/.gef.rc
	rm -rf ${HOME}/.gitconfig
	rm -rf ${HOME}/.gef-scripts
	rm -rf ${HOME}/.inputrc
	rm -rf ${HOME}/.pythonrc
	rm -rf ${HOME}/.tmux.conf
	rm -rf ${HOME}/.idapro/idauser.cfg
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.vim/snippets
	rm -rf ${HOME}/.zshrc

pre:
	# install requirements
	apt install -y curl vim zsh
	# install oh-my-zsh
	@if [ ! -d ~/.oh-my-zsh/ ]; then\
		curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash;\
	fi

	# pre-install NERD_Commenter plugin
	@if [ ! -e ~/.vim/plugin/NERD_Commenter.vim ]; then\
		curl -fLo ~/.vim/plugin/NERD_Commenter.vim --create-dirs https://raw.githubusercontent.com/scrooloose/nerdcommenter/master/plugin/NERD_commenter.vim;\
	fi