
# Lista de Aplicativos do Fedora

## Flatpak

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
| CPU-X |                          …b.thetumultuousunicornofdarkness.cpu-x  |
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
| Menu Principal  |                …berg.libre_menu_editor.LibreMenuEditor  |
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
     

## Pós Instalação Fedora

### Script para Workstation 
- [Script Pós-Instalação Fedora Silverblue](https://gist.github.com/diogopessoa/d66ec201068ac799da7a25f996be5cfe#file-pos-install-silverblue-sh)

### Script para Silverblue
- [Script Pós-install Fedora Workstation](https://github.com/diogopessoa/fedora-flatpak-setup)
  

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

## GNOME Shell Extensions
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

## Extensões de Navegador
- Dark Reader
- RainDrop.io
- Mate Translate
- Adguard (o Brave não precisa)
- Seek Subtitles for YouTube

## Brave Browser Ajustes 

Menu, Configurações...

=> Desative:
- Brave Rewards/recompensas;
- ​Brave News/notícias;
- Brave Wallet/caritera;
- Notificações;
- Mostrar número ícone do escudo;

=> Filtros de conteúdo:
- Fanboys Annoyances + uBO
- Bypass Paywalls Clean 

=> Ative:
- Widevine
- Indexar outros mecanismos de pesquisa
- Economia de memória


## Pasta "share" para compartilhamentos
- [share](https://github.com/diogopessoa/my-packages-lists/tree/main/share)
- [notes](https://github.com/diogopessoa/my-packages-lists/blob/main/share/notes.txt)

## Salvar e Restaurar as configurações Flatpak
O aplicativo "Save Desktop" permite salvar a configuração atual (temas, ícones, papéis de parede, extensões, etc.) com um único clique para restaurar em outra máquina.

