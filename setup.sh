clear
B="$(tput setaf 0)"
W="$(tput setaf 7)"

echo "$W███$B╗   $W███$B╗$W██$B╗   $W██$B╗     $W██████$B╗ $W██████$B╗ $W███$B╗   $W██$B╗$W███████$B╗$W██$B╗ $W██████$B╗ $W███████$B╗"
echo "$W████$B╗ $W████$B║╚$W██$B╗ $W██$B╔╝    $W██$B╔════╝$W██$B╔═══$W██$B╗$W████$B╗  $W██$B║$W██$B╔════╝$W██$B║$W██$B╔════╝ $W██$B╔════╝"
echo "$W██$B╔$W████$B╔$W██$B║ ╚$W████$B╔╝     $W██$B║     $W██$B║   $W██$B║$W██$B╔$W██$B╗ $W██$B║$W█████$B╗  $W██$B║$W██$B║  $W███$B╗$W███████$B╗"
echo "$W██$B║╚$W██$B╔╝$W██$B║  ╚$W██$B╔╝      $W██$B║     $W██$B║   $W██$B║$W██$B║╚$W██$B╗$W██$B║$W██$B╔══╝  $W██$B║$W██$B║   $W██$B║╚════$W██$B║"
echo "$W██$B║ ╚═╝ $W██$B║   $W██$B║       ╚$W██████$B╗╚$W██████$B╔╝$W██$B║ ╚$W████$B║$W██$B║     $W██$B║╚$W██████$B╔╝$W███████$B║"
echo "$B╚═╝     ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝$W"
echo

instalation() {
    # loads the config files
    cd ~
    yes | pacman -S git 
    git clone https://github.com/GabrielNito/gnome-setup
    cd gnome-setup

    # .bashrc
    mv .bashrc ~

    # # theme
    mkdir ~/.themes
    mv Catppuccin-Frappe-Standard-Lavender-Dark ~/.themes/

    # kitty
    yes | pacman -S kitty
    mv kitty.conf /home/arch/.config/kitty/

    # shortcuts
    dconf load / < user.conf

    # btop
    yes | pacman -S btop
    mv btop ~/.config/

    # Ascii
    mkdir ~/Customization
    cp Ascii/ ~/Customization
    
    # install vscode
    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    makepkg -si
    systemctl enable --now snapd.socket
    ln -s /var/lib/snapd/snap /snap
    curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/visual-studio-code-bin.tar.gz
    tar -xvf visual-studio-code-bin.tar.gz
    cd visual-studio-code-bin
    makepkg -si
    cd ~

    mv pacman.conf /etc/

    # annotations
    rm -rf gnome-setup
    clear
    echo "Extra steps: "
    echo " - Install Gnome Extensions Manager"
    echo " - Install Forge as a TM"
    echo " - Install Discord"
    echo " - Install Brave"
}
while true; do
    echo "《·───────────────·》 《·───────────────·》"
    read -p "    Proceed with instalation? [Y/n] " yn
    echo "《·───────────────·》 《·───────────────·》"
    case $yn in
        * ) instalation; break;;
        [Yy]* ) instalation; break;;
        [Nn]* ) exit;;
    esac
done