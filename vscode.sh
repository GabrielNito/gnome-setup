# Vscode
cd ~
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -sif
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/visual-studio-code-bin.tar.gz
tar -xvf visual-studio-code-bin.tar.gz
cd visual-studio-code-bin
makepkg -sif
cd ~