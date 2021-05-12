#!/bin/bash -e
# Install git
sudo apt update
echo '[*] Installing git...'
sudo apt install git -y

# Install the Curl
echo '[*] Installing Curl...'
sudo apt install curl -y

# Install the yarn
echo '[*] Installing yarn...'
sudo apt install yarn -y

# Install zsh
echo '[*] Installing Zsh...'
sudo apt install zsh -y

echo '[*] Changing the shellmode from bash to zsh...'
chsh -s $(which zsh)

# Install Tmux
sudo apt install tmux -y

# Install 'Oh-My-Zsh'
#echo '[*] Installing the oh-my-zsh! ...'
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Zinit for sintax-hightligh, autosuggestions, and completions
cd ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# Install the Dracula Dark Theme for gnome Terminal
echo '[*] Installing the Dracula Dark Theme for gnome Terminal...'
cd ~/
sudo apt-get install dconf-cli
dracula_dir="${HOME}/gnome-terminal"
if [ ! -d "${dracula_dir}" ]; then
	echo "[*] Cloning https://github.com/dracula/gnome-terminal..."
	git clone https://github.com/dracula/gnome-terminal
else
	echo "[*] Already exist gnome-terminal dir"
	cd gnome-terminal
	./install.sh
fi
echo "[*] Done!"

# Clone the 'Spaceship' zsh's theme repository
echo '[*] Installing the 'Spaceship' Theme for gnome Terminal...'
cd ~/.oh-my-zsh/themes/
spaceship_dir="${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"
if [ ! -d "${spaceship_dir}" ]; then
	echo "[*] Cloning https://github.com/denysdovhan/spaceship-prompt.git.."
	git clone https://github.com/denysdovhan/spaceship-prompt.git
	mkdir -p "${spaceship_dir}"
else
	echo "[*] Already exist spaceship.zsh-theme dir"
	cd spaceship.zsh-theme
	./install.sh
fi
echo "[*] Done!"

# Create a Symbol link in the 'Oh-My-Zsh' 
cd ~/.oh-my-zsh/themes
echo "[*] Create a Symbol link in the 'Oh-My-Zsh'..."
ln -s "/spaceship-prompt/spaceship.zsh-theme" "/spaceship.zsh-theme"
# Copy .zshrc in working directory to nvim's config location ...
echo '[*] Copying .zshrc  into -> HOME'
cd ~/dotfiles-phme
cp .zshrc ~/
cd ~/
echo "[*] Done!"


# Install the 'FiraCode', a font for the Draculas icon template (https://github.com/tonsky/FiraCode/releases)
echo "[*] Downloading 'FiraCode' patch font into ~/.local/share/fonts ..."
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
	echo "mkdir -p $fonts_dir"
	mkdir -p "${fonts_dir}"
else
	echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
	file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
	file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
	if [ ! -e "${file_path}" ]; then
		echo "wget -O $file_path $file_url"
		wget -O "${file_path}" "${file_url}"
	else
		echo "Found existing file $file_path"
	fi;
done

echo "fc-cache -f"
fc-cache -f

#Install 'Oh-My-Tmux'
cd ~/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local
cd ~/dotfiles-phme/
cp .tmux.conf.local ~/
cd ~/


### CONFIGURATE NVIM EDITOR

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

# Install nvim (and its dependencies: pip3, git), Python 3 and ctags (for tagbar)
echo '[*] App installing Neovim and its dependencies (Python 3 and git), and dependencies for tagbar (exuberant-ctags) ...'
sudo apt update
sudo apt install neovim python3 python3-pip python3-venv git curl exuberant-ctags -y

# Install virtualenv to containerize dependencies
echo '[*] Pip installing venv to containerize Neovim dependencies (instead of installing them onto your system) ...'
python3 -m venv ~/.config/nvim/env

# Install pip modules for Neovim within the virtual environment created
echo '[*] Activating virtualenv and pip installing Neovim (for Python plugin support), libraries for async autocompletion support (jedi, psutil, setproctitle), and library for pep8-style formatting (yapf) ...'
source ~/.config/nvim/env/bin/activate
pip install pynvim jedi psutil setproctitle yapf doq # run `pip uninstall neovim pynvim` if still using old neovim module
deactivate

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'll be using Iosevka for Powerline)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

# (Optional) Alias vim -> nvim
echo '[*] Aliasing vim -> nvim, remember to source ~/.bashrc ...'
echo "alias vim='nvim'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.zshrc

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo -e '[*] Running :PlugInstall within nvim ...'
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

# Copy init.vim in current working directory to nvim's config location ...
echo '[*] Copying init.vim -> ~/.config/nvim/init.vim'
cp init.vim ~/.config/nvim/

echo -e "[+] Done, welcome to \033[1m\033[92mNeoVim\033[0m! Load the terminal hitting 'tmux' then 'vim'"

# Clone the wallpaper repository in the respective directory and set the scrip to alternate the images
#cd ~/
#mkdir -p ~/Pictures/wallpapers
#cd ~/Pictures/wallpapers
#git clone https://github.com/pedroesmerio/wallpapers.git
#cd ~/dotfiles-phme
#cp .wallpapers ~/Pictures/wallpapers
#echo '[*] reload the system to see the new configuration!'
