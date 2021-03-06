#!/bin/bash

output_end () {
	echo "######################################################################"
	echo "                    $1 software installed  "
	echo "######################################################################"
}


sudo apt update -y
output_end Updates

if ! [ -x "$(command -v google-chrome-stable)" ]; then
	# install google chrome
	sudo apt install -y google-chrome-stable
	output_end Chrome
else
    echo "$(command google-chrome-stable --version)"
fi

if ! [ -x "$(command -v code)" ]; then
	# install visual studio code
	sudo apt install -y code
	output_end Code
else
    echo "$(command code --version)"
fi

# install extensions
# pwd
cat bin/vs_code_extensions_list.txt | xargs -n 1 code --install-extension
output_end Code Ext

# install apps
sudo apt install -y neovim zsh tmux git postgresql postgresql-contrib gcc g++ make
output_end Apps

# install oh my zsh and copy files to directory
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo cp -r bin/zsh/.oh-my-zsh /home/$USER/
sudo cp bin/zsh/.zshrc /home/$USER/
output_end "Oh My ZSH"


# install nodejs and npm
# echo "Installing NodeJS & NPM"
sudo apt install -y curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs
# node --version
# npm --version
sudo npm i -g jshint
output_end Node
# install react
sudo npm i -g create-react-app
output_end React
# Install react-static
sudo npm i -g react-static

# Move Fonts
sudo cp -r bin/.fonts /home/$USER
output_end Fonts


# # Run `sudo apt-get install -y nodejs` to install Node.js 13.x and npm
# ## You may also need development tools to build native addons:
#      sudo apt-get install gcc g++ make
# ## To install the Yarn package manager, run:
#      curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#      sudo apt-get update && sudo apt-get install yarn
