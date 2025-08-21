
# Minha lista de aplicativos

| ID application                                  | Nome                               |
|-------------------------------------------------|------------------------------------|
| app.devsuite.Ptyxis                             | Ptyxis                             |
| be.alexandervanhee.gradia                       | Gradia                             |
| com.bitwarden.desktop                           | Bitwarden                          |
| com.calibre_ebook.calibre                       | calibre                            |
| com.github.jeromerobert.pdfarranger             | PDF Arranger                       |
| com.github.neithern.g4music                     | Gapless                            | 
| com.github.PintaProject.Pinta                   | Pinta                              |
| com.mattjakeman.ExtensionManager                | Gerenciador de Extensões           |
| com.protonvpn.www                               | Proton VPN                         |
| com.vivaldi.Vivaldi                             | Vivaldi                            |
| com.warlordsoftwares.youtube-downloader-4ktube  | 4KTUBE                             |
| de.haeckerfelix.Fragments                       | Fragments                          |
| garden.jamie.Morphosis                          | Morphosis                          |
| io.ente.auth                                    | Ente Auth                          |
| io.github.celluloid_player.Celluloid            | Reprodutor de Multimídia Celluloid |
| io.github.dvlv.boxbuddyrs                       | BoxBuddy                           |  
| md.obsidian.Obsidian                            | Obisidian                          |
| org.freefilesync.FreeFileSync                   | FreeFileSync                       |
| org.gnome.baobab                                | Analisador de uso de disco         |
| org.gnome.Calculator                            | Calculadora                        |
| org.gnome.Calendar                              | Calendário                         |
| org.gnome.Characters                            | Caracteres                         |
| org.gnome.clocks                                | Relógios                           |
| org.gnome.Connections                           | Conexões                           |
| org.gnome.Papers                                | Visualizador de documentos         |
| org.gnome.font-viewer                           | Fontes                             |
| org.gnome.gitlab.YaLTeR.VideoTrimmer            | Video Trimmer                      |
| org.gnome.gThumb                                | Visualizador de imagens gThumb     |
| org.gnome.Logs                                  | Logs                               |
| org.gnome.Loupe                                 | Visualizador de imagens            |
| org.gnome.SimpleScan                            | Digitalizador de documentos        |
| org.gnome.Snapshot                              | Câmera                             |
| org.gnome.Solanum                               | Solanum                            |
| org.gnome.SoundRecorder                         | Gravador de som                    |
| org.gnome.TextEditor                            | Editor de Texto                    |
| org.onlyoffice.desktopeditors                   | ONLYOFFICE Desktop Editors         |
| org.telegram.desktop                            | Telegram                           |
| org.upscayl.Upscayl                             | Upscayl                            |
| io.github.flattool.Ignition                     | Ignition                           |   
| page.codeberg.libre_menu_editor.LibreMenuEditor | Menu Principal                     |
| me.timschneeberger.jdsp4linux 		                | JamesDSP                           |
| run page.tesk.Refine                            | Tweak of GNOME
| org.virt_manager.virt-manager                   | Virt-Manager                       |
| com.github.zocker_160.SyncThingy                | Syncthing + simple tray indicator  |  
     

## 1. Instalar todos os flatpak de uma vez:

```bash
flatpak install flathub --assumeyes --noninteractive app.devsuite.Ptyxis be.alexandervanhee.gradia com.bitwarden.desktop com.calibre_ebook.calibre com.github.jeromerobert.pdfarranger com.github.neithern.g4music com.github.PintaProject.Pinta com.mattjakeman.ExtensionManager com.protonvpn.www com.vivaldi.Vivaldi com.warlordsoftwares.youtube-downloader-4ktube de.haeckerfelix.Fragments garden.jamie.Morphosis io.ente.auth io.github.celluloid_player.Celluloid io.github.dvlv.boxbuddyrs md.obsidian.Obsidian org.freefilesync.FreeFileSync org.gnome.baobab org.gnome.Calculator org.gnome.Calendar org.gnome.Characters org.gnome.clocks org.gnome.Connections org.gnome.Papers org.gnome.font-viewer org.gnome.gitlab.YaLTeR.VideoTrimmer org.gnome.gThumb org.gnome.Logs org.gnome.Loupe org.gnome.SimpleScan org.gnome.Snapshot org.gnome.Solanum org.gnome.SoundRecorder org.gnome.TextEditor org.onlyoffice.desktopeditors org.telegram.desktop org.upscayl.Upscayl page.codeberg.libre_menu_editor.LibreMenuEditor me.timschneeberger.jdsp4linux run page.tesk.Refine org.virt_manager.virt-manager com.github.zocker_160.SyncThingy
```

## 2. Ajuste de Tema GTK para aplicações Flatpak

- Instalar o tema
```bash
sudo dnf install adw-gtk3-theme
```

- Aplicar o tema
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
```

- Concluir a configuração
```bash
flatpak update
```

### Tema de ícones GTK

- Hatter
https://github.com/Mibea/Hatter?tab=readme-ov-file 

```bash
git clone https://github.com/Mibea/Hatter.git
```

```bash
./install.sh
```


## RPM
```bash
sudo dnf install snapper btrfs-assistant fish
```

## Configurações e Ajustes

### Btrfs Assistant (X11)
- pkexec btrfs-assistant (execução no atalho do menu)

### SyncThing (https://github.com/zocker-160/SyncThingy)
Após instalar o SyncThingy (Flatpak):
- instale a extensão 'AppIndicator and KStatusNotifierItem';
- Configuração:
 - Clique com o botão direito do mouse no ícone do SyncThiny na bandeja do sistema
 - Selecione Configurações
 - Pressione o botão "Instalar como serviço do sistema"
 - Pressione "Copiar para a área de transferência"
 - Abra o terminal
 - Cole o comando e pressione Enter e reinicie o sistema.
 - 
#### Atalho Syncthing WebUI
 - no navegador de internet, crie um atalho para o menu de aplicativos.
 - agora pode remover a extensão 'AppIndicator'


### GNOME Shell Extensions
- Caffeine
- Clipboard indicator @tudomatu.com
- Compact top bar @metehan
- Dash to dock
- Gsconnect 
- Quick setting audio panel
- Vitals @corecoding
- Window title is back@fthx

## Salvar e Restaurar as configurações
O aplicativo "Save Desktop" permite salvar a configuração atual (temas, ícones, papéis de parede, extensões, etc.) com um único clique para restaurar em outra máquina.

