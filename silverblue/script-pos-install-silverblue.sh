#!/usr/bin/env bash
set -euo pipefail

# Verifica se está rodando como root (não recomendado para este script)
if [[ $EUID -eq 0 ]]; then
  echo "ERRO: Não execute este script com sudo ou como root!"
  echo "      Rode como usuário normal: ./pos-install-silverblue.sh"
  echo "      Partes que precisam de privilégio já usam 'sudo' internamente."
  exit 1
fi

############################################
# Pós-Instalação Fedora Silverblue
############################################

# Encerrando gnome-software para evitar conflitos
pkill -f gnome-software || true

############################################
# 1. Desativar serviço desnecessário no boot
############################################

echo ""
echo "-------------------------------------------------"
echo "Desativando NetworkManager-wait-online.service..."
echo "-------------------------------------------------"
sudo systemctl disable NetworkManager-wait-online.service || true

############################################
# 2. Instalação das fontes do Office
############################################

echo ""
echo "-----------------------------------------------"
echo "Instalando fontes Office na pasta do usuário..."
echo "-----------------------------------------------"

FONTS_DIR="$HOME/.local/share/fonts/office_fonts"
TMP_ZIP="/tmp/office_fonts.zip"

mkdir -p "$FONTS_DIR"

curl -fsSL https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/office_fonts.zip -o "$TMP_ZIP"

unzip -o "$TMP_ZIP" "*.ttf" -d "$FONTS_DIR"

fc-cache -f "$HOME/.local/share/fonts"

rm -f "$TMP_ZIP"

echo ""
echo "-------------------------------------"
echo "Fontes Office instaladas com sucesso!"
echo "-------------------------------------"

############################################
# 3. Tema de Ícones Hatter
############################################

echo ""
echo "------------------------------"
echo "Instalando os Ícones Hatter..."
echo "------------------------------"

ICONS_DIR="$HOME/.local/share/icons"
HATTER_DIR="$HOME/Downloads/Hatter"

rm -rf "$HATTER_DIR"
git clone https://github.com/Mibea/Hatter.git "$HATTER_DIR"

mkdir -p "$ICONS_DIR"

# Copia apenas os variantes desejados
cp -r "$HATTER_DIR/Hatter" "$ICONS_DIR/"

# Atualiza cache
gtk-update-icon-cache "$ICONS_DIR/Hatter" || true

# Aplica o tema de ícones Hatter
gsettings set org.gnome.desktop.interface icon-theme 'Hatter'

flatpak override --user --filesystem=xdg-config/gtk-3.0
flatpak override --user --filesystem=xdg-config/gtk-4.0

rm -rf "$HATTER_DIR"
echo ""
echo "-----------------------------"
echo "Hatter instalado com sucesso!"
echo "-----------------------------"


############################################
# 4. RPM-OSTree Manager
############################################

echo ""
echo "--------------------------------"
echo "Instalando RPM-OSTree Manager..."
echo "--------------------------------"
curl -fsSL https://raw.githubusercontent.com/diogopessoa/rpm-ostree-manager/main/install.sh | bash


############################################
# Migração Fedora Flatpak para Flathub
############################################

echo ""
echo "--------------------------------------------------"
echo "Configurando Flatpak: migrando Fedora → Flathub..."
echo "--------------------------------------------------"

# 1. Garante Flathub system-wide
flatpak remote-add --if-not-exists --system flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo

# 2. Lista SOMENTE apps instalados pelo remoto Fedora
apps_fedora=$(flatpak list --app --system --columns=application,origin \
  | awk '$2 ~ /^fedora(-testing)?$/ {print $1}')

# 3. Remove apenas apps Flatpak Fedora
if [ -n "$apps_fedora" ]; then
  echo ""
  echo "------------------------------------------------------"
  echo "Removendo aplicativos instalados via Fedora Flatpak..."
  echo "------------------------------------------------------"
  for app in $apps_fedora; do
    flatpak uninstall --system --assumeyes "$app" || true
  done
fi

# 4. Lista de apps essenciais
lista_apps=(
  org.gnome.Baobab
  org.gnome.Calculator
  org.gnome.Calendar
  org.gnome.Clocks
  org.gnome.Contacts
  org.gnome.Connections
  org.gnome.FontViewer
  org.gnome.FileRoller
  org.gnome.Loupe
  org.gnome.Papers
  org.gnome.SimpleScan
  org.gnome.Snapshot
  org.gnome.TextEditor
  it.mijorus.smile
  io.missioncenter.MissionCenter
  org.gnome.Showtime
  com.github.neithern.g4music
  com.mattjakeman.ExtensionManager
  com.brave.Browser
  page.codeberg.libre_menu_editor.LibreMenuEditor
  page.tesk.Refine
)

# 5. Instala tudo via Flathub
echo "Instalando aplicativos do Flathub..."
for app in "${lista_apps[@]}"; do
  flatpak install --system --assumeyes flathub "$app" \
    || echo "Aviso: $app não disponível no Flathub."
done

# 6. Remove remotes Fedora (opcional, após migração)
flatpak remote-delete fedora --force 2>/dev/null || true
flatpak remote-delete fedora-testing --force 2>/dev/null || true

# 7. Limpeza
flatpak uninstall --unused --assumeyes

echo ""
echo "--------------------------------"
echo "Migração para Flathub concluída!"
echo "--------------------------------"


############################################
# Finalização
############################################

echo ""
echo "###################################################"
echo "Pós-instalação concluída com sucesso! :)"
echo "Reinicie o sistema para aplicar todas as mudanças."
