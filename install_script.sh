!#/bin/bash

# add to wheel group
# check username $whoami
# sudo visudo
# hemant ALL=(ALL) NOPASSWD: ALL

# st-line-lukesmith

# Python
# symlink python
sudo ln -s /usr/bin/python3 /usr/bin/python
# pip install folder requires a file 

# install virtualenv
pip install virtualenv

# set default browser
# https://askubuntu.com/questions/1175383/cant-change-default-browser-in-lubuntu-19-04



# i3

# Prepare Apps folder
# move apps to ~/apps/bin
# copy to bin folder with apps in $HOME
mkdir -p $HOME/apps/bin

# vim
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# taskwarrior
sudo apt install cmake
tar xzvf task-2.6.2.tar.gz
cd task-2.6.2
cmake -DCMAKE_INSTALL_PREFIX:$HOME/apps -DENABLE_SYNC=OFF -DCMAKE_BUILD_TYPE=release .
make
sudo make install

# rust
# rust cargo
curl https://sh.rustup.rs -sSf | sh

# taskwarrior-tui
git clone https://github.com/kdheepak/taskwarrior-tui.git
cd taskwarrior-tui
cargo build --release

# youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o $HOME/apps/bin/youtube-dl
sudo chmod a+rx $HOME/apps/bin/youtube-dl

# foundry
curl -L https://foundry.paradigm.xyz | bash
move to apps and prepare man page
source .bashrc
foundryup


# stow folders
# call stow to complete personal settings
# vim bashrc scripts utilities
# create folders .hp_scripts, .hp_notes, .hp_dotfiles
# yank from github repo and run stow
# append to crontab
# # m h  dom mon dow   command
# */15 * * * * /usr/bin/bash /home/hemant/scripts/price-alert.sh


# Reboot system
sudo reboot now
