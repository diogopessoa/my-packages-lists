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
# 1. Redução do uso de Swap (Swappiness)
############################################

echo "Configurando swappiness para 10..."
sudo tee /etc/sysctl.d/99-swappiness.conf <<EOF
vm.swappiness=10
vm.vfs_cache_pressure=50
EOF

############################################
# 2. Desativar serviço desnecessário no boot
############################################

echo "Desativando NetworkManager-wait-online.service..."
sudo systemctl disable NetworkManager-wait-online.service || true

############################################
# 3. Instalação das fontes do Office
############################################

echo "Instalando fontes Office na pasta do usuário..."

FONTS_DIR="$HOME/.local/share/fonts/office_fonts"
TMP_ZIP="/tmp/office_fonts.zip"

mkdir -p "$FONTS_DIR"

curl -fsSL https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/office_fonts.zip -o "$TMP_ZIP"

unzip -o "$TMP_ZIP" "*.ttf" -d "$FONTS_DIR"

fc-cache -f "$HOME/.local/share/fonts"

rm -f "$TMP_ZIP"

echo "Fontes Office instaladas com sucesso."

############################################
# 4. Tema de Ícones Hatter
############################################

echo "Instalando os Ícones Hatter..."

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
echo "Hatter instalado com sucesso."


############################################
# 5. RPM-OSTree Manager
############################################

echo "Instalando RPM-OSTree Manager..."
curl -fsSL https://raw.githubusercontent.com/diogopessoa/rpm-ostree-manager/main/install.sh | bash


###########################################
# 6. Migração Fedora Flatpak para Flathub
###########################################

echo "Configurando Flatpak: priorizando Flathub..."

# 1. Adiciona Flathub (system-wide)
flatpak remote-add --if-not-exists --system flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 2. Migra apps existentes do remote Fedora para Flathub
apps_fedora=$(flatpak list --app --columns=application,origin | awk '$2 ~ /^fedora(-testing)?$/ {print $1}')

if [ -n "$apps_fedora" ]; then
    echo "Transferindo aplicativos do Fedora para Flathub..."
    for app in $apps_fedora; do
        flatpak install --system --assumeyes flathub "$app" || echo "Aviso: $app não disponível no Flathub."
    done
fi

# 3. Instala os apps essenciais do GNOME
echo "Instalando aplicativos do Flathub..."
lista_apps=(
  org.gnome.Baobab \
  org.gnome.Calculator \
  org.gnome.Calendar \
  org.gnome.Characters \
  org.gnome.Clocks \
  org.gnome.Contacts \
  org.gnome.Connections \
  org.gnome.FontViewer \
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
  com.mattjakeman.ExtensionManager \
  page.codeberg.libre_menu_editor.LibreMenuEditor \
  page.tesk.Refine    
)

for app in "${lista_apps[@]}"; do
    # O "|| true" garante que se o app falhar, o script não pare
    flatpak install --system --assumeyes flathub "$app" || echo "Erro ao instalar $app, pulando..."
done

# 4. Limpeza final
echo "Limpando remotes antigos e arquivos órfãos..."
flatpak remote-delete fedora --force 2>/dev/null || true
flatpak remote-delete fedora-testing --force 2>/dev/null || true
flatpak uninstall --unused --assumeyes
echo "Configuração do Flatpak Flathub concluída!"

############################################
# Finalização
############################################

echo ""
echo "Pós-instalação concluída com sucesso."
echo "Reinicie o sistema para aplicar todas as mudanças."
