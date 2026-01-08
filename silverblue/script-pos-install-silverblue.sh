#!/usr/bin/env bash
set -e

############################################
# Pós-Instalação Fedora Silverblue 43
############################################
## INSTALAÇÃO
##
## Execute o comando abaixo após uma instalação limpa:
## curl -fsSL https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/script-pos-install-silverblue.sh | bash
##
############################################


echo "Encerrando gnome-software para evitar conflitos com rpm-ostree/Flatpak..."
pkill -f gnome-software || true

############################################
# 1. Configuração do Flatpak (Flathub)
############################################

echo "Configurando Flatpak e Flathub..."

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
flatpak uninstall --all --delete-data --assumeyes && \
(flatpak remote-delete fedora --force || true) && \
(flatpak remote-modify --disable fedora || true) && \
flatpak install --system flathub --assumeyes \
  org.gnome.baobab \
  org.gnome.Calculator \
  org.gnome.Calendar \
  org.gnome.Characters \
  org.gnome.clocks \
  org.gnome.Contacts \
  org.gnome.Connections \
  org.gnome.font-viewer \
  org.gnome.FileRoller \
  org.gnome.Loupe \
  org.gnome.Papers \
  org.gnome.SimpleScan \
  org.gnome.Snapshot \
  org.gnome.TextEditor \
  org.mozilla.firefox \
  io.missioncenter.MissionCenter \
  org.gnome.Showtime \
  com.github.neithern.g4music \
  page.codeberg.libre_menu_editor.LibreMenuEditor page.tesk.Refine \
  com.mattjakeman.ExtensionManager \
  page.tesk.Refine

rpm-ostree install --allow-inactive openssl || true

############################################
# 2. Redução do uso de Swap (Swappiness)
############################################

echo "Configurando swappiness..."

sudo tee /etc/sysctl.d/99-swappiness.conf <<EOF
vm.swappiness=10
vm.vfs_cache_pressure=50
EOF

sudo sysctl --system

############################################
# 3. Desativar serviço desnecessário no boot
############################################

echo "Desativando NetworkManager-wait-online.service..."
sudo systemctl disable NetworkManager-wait-online.service || true

############################################
# 4. Instalação das fontes Office
############################################

echo "Instalando fontes Office..."

HOME_DIR="/var/home/$USER"
FONTS_DIR="$HOME_DIR/.local/share/fonts/officefonts"
TMP_ZIP="/tmp/officefonts.zip"

mkdir -p "$FONTS_DIR"

echo "Baixando officefonts.zip do GitHub..."
curl -fsSL \
  https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/officefonts.zip \
  -o "$TMP_ZIP"

echo "Extraindo fontes..."
unzip -o "$TMP_ZIP" "*.ttf" -d "$FONTS_DIR"

echo "Atualizando cache de fontes..."
fc-cache -f "$HOME_DIR/.local/share/fonts"

rm -f "$TMP_ZIP"

############################################
# 5. Tema de Ícones Hatter
############################################

echo "Instalando tema de ícones Hatter..."

ICONS_DIR="$HOME_DIR/.local/share/icons"
HATTER_DIR="$HOME_DIR/Downloads/Hatter"

rm -rf "$HATTER_DIR"
git clone https://github.com/Mibea/Hatter.git "$HATTER_DIR"

mkdir -p "$ICONS_DIR"
cd "$HATTER_DIR"
chmod +x install.sh
./install.sh -d "$ICONS_DIR" -n Hatter

gsettings set org.gnome.desktop.interface icon-theme 'Hatter'

flatpak override --user --filesystem=xdg-config/gtk-3.0
flatpak override --user --filesystem=xdg-config/gtk-4.0

############################################
# 6. RPM-OSTree Manager
############################################

echo "Instalando RPM-OSTree Manager..."
curl -fsSL https://raw.githubusercontent.com/diogopessoa/rpm-ostree-manager/main/install.sh | bash

############################################
# Finalização
############################################

echo "Pós-instalação concluída com sucesso."
echo "Reinicie o sistema para aplicar todas as mudanças."








