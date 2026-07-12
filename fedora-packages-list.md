
# Lista de Programas e Ajustes que uso no Fedora

## Flatpak Instalados

| ID application                                  | Nome                               |
|-------------------------------------------------|------------------------------------|
| adw-gtk3 theme |             org.gtk.Gtk3theme.adw-gtk3  |             
| adw-gtk3 theme Dark  |            org.gtk.Gtk3theme.adw-gtk3-dark  |        
| Analisador de discos |            org.gnome.baobab |                                     
| Bitwarden  |                     com.bitwarden.desktop  |                  
| Brave |                          com.brave.Browser  |                      
| Caixas |                         org.gnome.Boxes |                         
| Calculadora  |                   org.gnome.Calculator |                    
| Calendário |                     org.gnome.Calendar  |                     
| Câmera |                         org.gnome.Snapshot  |                     
| Collector |                      it.mijorus.collector |                   
| Constrict |                      io.github.wartybix.Constrict |            
| Conta-Gotas |                    com.github.finefindus.eyedropper  |       
| Contactos  |                     org.gnome.Contacts |                      
| CPU-X |                          io.github.thetumultuousunicornofdarkness.cpu-x  |
| Digitalizador de documentos |    org.gnome.SimpleScan |                    
| DistroShelf |                    com.ranfdev.DistroShelf  |                
| Easy Effects  |                  com.github.wwmm.easyeffects |            
| Editor de texto |                org.gnome.TextEditor  |                   
| FFaudioConverter |               com.github.Bleuzen.FFaudioConverter  |    
| Flatseal  |                      com.github.tchx84.Flatseal  |             
| Fontes |                         org.gnome.font-viewer |                   
| Fragments  |                     de.haeckerfelix.Fragments |              
| FreeFileSync  |                  org.freefilesync.FreeFileSync |           
| Gapless |                        com.github.neithern.g4music  |            
| Gestor de Arquivos |             org.gnome.FileRoller |                    
| Gestor de Extensões |            com.mattjakeman.ExtensionManager  |       
| HandBrake |                      fr.handbrake.ghb  |                       
| Shotwell  |                      org.gnome.Shotwell.HEIC |                                         
| Ignition |                       io.github.flattool.Ignition |             
| Intel VAAPI driver |             org.freedesktop.Platform.VAAPI.Intel  |                            
| LocalSend  |                     org.localsend.localsend_app |             
| Menu Principal  |                page.codeberg.libre_menu_editor.LibreMenuEditor  |
| Mission Center |                 io.missioncenter.MissionCenter  |         
| musicpod |                       org.feichtmeier.Musicpod  |               
| OBS Studio |                     com.obsproject.Studio  |                  
| Obsidian |                       md.obsidian.Obsidian  |                   
| ONLYOFFICE Desktop Editors |     org.onlyoffice.desktopeditors |           
| PDF Arranger |                   com.github.jeromerobert.pdfarranger |    
| Pika Backup  |                   org.gnome.World.PikaBackup  |             
| Proton VPN |                     com.protonvpn.www  |                      
| ProtonUp-Q |                    net.davidotek.pupgui2  |                  
| Refine |                         page.tesk.Refine |                        
| Registos |                       org.gnome.Logs  |                        
| Relógios |                       org.gnome.clocks |                       
| Reprodutor de vídeo |            org.gnome.Showtime |                      
| RustDesk  |                      com.rustdesk.RustDesk  |                  
| Shotwell  |                      org.gnome.Shotwell |                      
| Smile |                          it.mijorus.smile |                        
| Steam |                          com.valvesoftware.Steam |                
| SyncThingy  |                    com.github.zocker_160.SyncThingy  |       
| Telegram  |                      org.telegram.desktop |                    
| Teleprompter |                   io.github.nokse22.teleprompter |         
| Video Trimmer |                  org.gnome.gitlab.YaLTeR.VideoTrimmer |                        
| Visualizador de documentos |     org.gnome.Papers  |                       
| Visualizador de imagens |         org.gnome.Loupe  |                        
| Warehouse |                       io.github.flattool.Warehouse   |          
| Zen |                            app.zen_browser.zen |     
     
### Instalar Flatpak

```bash 
flatpak install --system --assumeyes flathub org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark org.gnome.baobab com.bitwarden.desktop com.brave.Browser org.gnome.Boxes org.gnome.Calculator org.gnome.Calendar org.gnome.Snapshot it.mijorus.collector io.github.wartybix.Constrict com.github.finefindus.eyedropper org.gnome.Contacts io.github.thetumultuousunicornofdarkness.cpu-x org.gnome.SimpleScan com.ranfdev.DistroShelf com.github.wwmm.easyeffects org.gnome.TextEditor com.github.Bleuzen.FFaudioConverter com.github.tchx84.Flatseal org.gnome.font-viewer de.haeckerfelix.Fragments org.freefilesync.FreeFileSync com.github.neithern.g4music org.gnome.FileRoller com.mattjakeman.ExtensionManager fr.handbrake.ghb org.gnome.Shotwell.HEIC io.github.flattool.Ignition org.freedesktop.Platform.VAAPI.Intel org.localsend.localsend_app page.codeberg.libre_menu_editor.LibreMenuEditor io.missioncenter.MissionCenter org.feichtmeier.Musicpod com.obsproject.Studio md.obsidian.Obsidian org.onlyoffice.desktopeditors com.github.jeromerobert.pdfarranger org.gnome.World.PikaBackup com.protonvpn.www net.davidotek.pupgui2 page.tesk.Refine org.gnome.Logs org.gnome.clocks org.gnome.Showtime com.rustdesk.RustDesk org.gnome.Shotwell it.mijorus.smile com.valvesoftware.Steam com.github.zocker_160.SyncThingy org.telegram.desktop io.github.nokse22.teleprompter org.gnome.gitlab.YaLTeR.VideoTrimmer org.gnome.Papers org.gnome.Loupe io.github.flattool.Warehouse app.zen_browser.zen
```

## Pós Instalação Fedora

### Script para Workstation 
- [Script Pós-install Fedora Workstation](https://github.com/diogopessoa/fedora-flatpak-setup)

### Script para Silverblue
- [Script Pós-Instalação Fedora Silverblue](https://gist.github.com/diogopessoa/d66ec201068ac799da7a25f996be5cfe#file-pos-install-silverblue-sh)

  

### Pacotes RPM

**Workstation**
```bash
sudo dnf install snapper btrfs-assistant fish distrobox adw-gtk3-theme
```

**Silverblue**
```bash
rpm-ostree install fish distrobox adw-gtk3-theme
```

## Configurações e Ajustes

### Btrfs Assistant (Workstation)
- pkexec btrfs-assistant (execução no atalho do menu)

### SyncThing 
Após instalar o SyncThingy (Flatpak), instale a extensão `AppIndicator and KStatusNotifierItem`.

Configuração:
``` 
 - Clique com o botão direito do mouse no ícone do SyncThiny na bandeja do sistema
 - Selecione Configurações
 - Pressione o botão "Instalar como serviço do sistema"
 - Pressione "Copiar para a área de transferência"
 - Abra o terminal
 - Cole o comando e pressione Enter e reinicie o sistema.
``` 
   
#### Atalho Syncthing WebUI
 - no navegador de internet, crie um atalho para o menu de aplicativos.
 - agora pode remover a extensão 'AppIndicator'

### GNOME Shell Extensions
- Caffeine
- Clipboard indicator @tudomatu.com
- Compact top bar @metehan
- Dash to dock
- Gsconnect
- Lock Keys @lockkeys
- Notification Timeout
- ScreenToSpace
- Quick setting audio panel
- Vitals @corecoding
- Window title is back@fthx

### Extensões de Navegador
- Dark Reader
- RainDrop.io
- Mate Translate
- Adguard (o Brave não precisa)
- Seek Subtitles for YouTube

### Brave Ajustes 

Menu, Configurações...

**=> Desative:**
- Brave Rewards/recompensas;
- ​Brave News/notícias;
- Brave Wallet/caritera;
- Notificações;
- Mostrar número ícone do escudo;

**=> Filtros de conteúdo:**
- Fanboys Annoyances + uBO
- Bypass Paywalls Clean 

**=> Ative:**
- Widevine
- Indexar outros mecanismos de pesquisa
- Economia de memória

### Anki addons
- Deck progress bar
- Passfail 2 remove the easy and hard buttons
- Review heatmap
- Smart keyboard

### SyncThingy

Abre **WebUI GUI - Pastas**

**Obsidian**
-  ID da pasta: gfaaq-gyot4
-  Pasta: /var/home/diogo/Imagens/Redmi 12S Camera

- Filtros:
``` 
(?d).DS_Store
(?d).thumbnails
(?d).trashed-*
(?d).stversions
(?d).stfolder
(?d)**/.~lock.*#
(?d)**/~$*
(?d)**/.*.tmp
(?d)**/*.tmp
(?d)**/*.TMP
(?d)**/cache/
(?d)**/Cache/
(?d)**/temp/
(?d)**/Temp/
(?i)**/.obsidian/plugins/*/data.*
(?i)**/.obsidian/*.json
(?i)**/.obsidian/workspace
(?i)**/.obsidian/core-plugins.json
```
**Redmi 12S Camera** 
- Filtros (nada)
- ID da pasta:	aoj9k-47hzk
- Pasta: /var/home/diogo/Documentos/Obsidian

## Atalhos de Teclado Personalizados
#### Atalhos de programas
- Terminal Ptyxis: comando `ptyxis`, atalho `Super+T`
- Smile emojis: comando `/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=smile it.mijorus.smile`, atalho `Super+;` 
- Collector: comando `/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=collector it.mijorus.collector`, atalho `Super++Alt+C`
- Clipboard Indicator: comando direto nas configurações do aplicativo. atalho `Super+C`

#### Atalhos Som e Mídia
- Aumentar volume: `Alt+Seta_Acima`
- Diminuir volume: `Alt+Seta_Abaixo`
- Faixa anterior: `Alt+<`
- Próxima faixa: `Alt+>`
- Reproduzir ou Pausar: `Alt+P`

#### Janelas
- Fechar a janela: `Alt+X`

#### Navegação
- Mover a janela do espaço de trabalho à direita: `Alt+Super+Page Down`
- Mover a janela do espaço de trabalho à esquerda: `Alt+Super+Page Up`


## Pasta "share" para compartilhamentos
- [share](https://github.com/diogopessoa/my-packages-lists/tree/main/share)
- [notes](https://github.com/diogopessoa/my-packages-lists/blob/main/share/notes.txt)

## Salvar e Restaurar as configurações Flatpak
O programa [Save Desktop](https://flathub.org/en/apps/io.github.vikdevelop.SaveDesktop) permite salvar a configuração atual (temas, ícones, papéis de parede, extensões, etc.) com um único clique para restaurar em outra máquina.

## Minha lista de Script e Guia de Instalação

#### Fedora Workstation
- [⬇️ Script Pós-install Fedora Workstation](https://github.com/diogopessoa/fedora-flatpak-setup)

#### Fedora Silverblue
- [⬇️ Script Pós-Instalação do Fedora Silverblue ](https://gist.github.com/diogopessoa/d66ec201068ac799da7a25f996be5cfe)
- [⬇️ Guia Pós-Instalação do Fedora Silverblue](https://github.com/diogopessoa/my-packages-lists/blob/main/silverblue/pos-install-fedora-silverblue.md)
- [📦️ Distrobox Container Auto-Upgrade](https://github.com/diogopessoa/distrobox-container-auto-upgrade)
- [🍺 Homebrew - Instalação no Fedora Silverblue](https://github.com/diogopessoa/my-packages-lists/blob/main/silverblue/brew-fedora-silverblue.md)
- [🍺 Homebrew - Script Auto-Update](https://github.com/diogopessoa/brew-update)

#### Bazzite
- [⚙️ Script Bazzite Lite](https://github.com/diogopessoa/bazzite-lite)
