if [[ ! "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit
fi

apt update
apt install ca-certificates -y
apt install okular dia curl wget gnupg software-properties-common lsb-release firefox apt-transport-https ffmpeg nodejs npm python3.10 pip3.10 golang -y
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
dpkg -i --force-depends onlyoffice-desktopeditors_amd64.deb

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends google-chrome-stable_current_amd64.deb

add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get install ethereum

add-apt-repository ppa:obsproject/obs-studio
apt update
apt install obs-studio

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

apt install code