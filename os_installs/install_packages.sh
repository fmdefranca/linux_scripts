#!/bin/bash

output_end () {
	echo "################################################################"
	echo "###################    $1 software installed  ################"
	echo "################################################################"
}


# sudo dnf update
output_end Updates

# install google chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
# sudo dnf install google-chrome-stable_current_x86_64.rpms
# rm google-chrome-stable_current_x86_64.rpm
output_end Chrome

# install visual studio code
# echo -e "[vscode]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" >> /etc/yum.repos.d/vscode.repo
# sudorpm --import https://packages.microsoft.com/keys/microsoft.asc
# sudo dnf install code
output_end Code

# install extensions
# pwd
# cat bin/vs_code_extensions_list.txt | xargs -n 1 code --install-extension
# output_end "Code Extensions"
output_end Code Ext

# install apps
# sudo dnf install -y neovim zsh tmux git inkscape postgresql postgresql-contrib
output_end Apps

# install oh my zsh and copy files to directory
# chsh -s /bin/zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sudo cp -r bin/zsh/.oh-my-zsh /home/$USER/
# sudo cp bin/zsh/.zshrc /home/$USER/
# output_end "Oh My ZSH"

# install nodejs and npm
# echo "Installing NodeJS & NPM"
# sudo dnf install curl
# curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
# sudo dnf install -y nodejs
# node --version
# npm --version
# output_end Node
# install react
sudo npm i -g create-react-app
output_end React

# Move Fonts
sudo cp -r bin/.fonts /home/$USER
output_end Fonts