UpdateRepoDB(){
	echo "Update pacman repo"
	sudo pacman --noconfirm -Syu
}

InstallNeededPackages(){
	echo "Install xorg"
	#sudo pacman --noconfirm -S xorg xorg-init
	sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb

	echo "Install other packages"
	sudo pacman --noconfirm -S bspwm sxhkd dmenu polybar picom xfce4-terminal gnu-free-fonts feh
}

InstallYay(){
	echo "Install yay"
	git clone https://aur.archlinux.org/yay.git 
  cd ./yay || exit
  makepkg -sir --noconfirm
  cd ..
  rm -rf yay
}

InstallBetterlockscreen(){
	InstallYay
	yay --noconfirm -S betterlockscreen
}

CopyConfigs(){
	mkdir -p ~/.config
	
	cp -rf ./Configs/.config/. ~/.config
	cp -rf ./Configs/.xinitrc ~/
	
	chmod +x ~/.config/bspwm/bspwmrc
	chmod +x ~/.config/polybar/launch.sh
}


UpdateRepoDB
InstallNeededPackages
#InstallYay

CopyConfigs
