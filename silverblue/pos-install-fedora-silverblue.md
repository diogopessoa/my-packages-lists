# **Guia Básico Pós-Instalação do Fedora Silverblue** 

Este guia cobre as configurações básicas após instalar o Fedora Silverblue. 
As sessões **2**, **4** e **5** que lidam com Flatpak e Containers, também são suportadas pelo **Fedora Kinoite** e demais Desktops Atômicos do Fedora. 

![Captura de tela Fedora Silverblue](https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/screenshot_silverblue_2025-07-31.png)
                                     
## **O que você irá ter com este guia:**

- ✅ **Repositórios adicionais** 
- ✅ **Substituição de Flatpak do Fedora pelo Flathub:** Codecs nativos
- ✅ **Toolbox:** ferramenta nativa para criar containers
- ✅ **Distrobox:** instalação e criação de containers com funcionalidades adicionais
- ✅ **Rollback do Sistema:** volta para uma versão anterior
- ✅ **Nvidia Driver:** link com instruções de instalação
- ✅ **Melhor integração com tema:** GTK + Flatpak  
- ✅ **Extensões do GNOME:** Opções adicionais 
- ✅ **Comandos essenciais:** dicas de gerenciamento rpm-ostree




## **Passo a Passo**


## Comando Automático para os passos '1' e '2' 

O comando abaixo automaticamente adiciona o repositório Flathub e substitui os programas Flatpak do Fedora pelo Flathub. Copie e cole o comando no terminal:

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
flatpak uninstall --all --delete-data --assumeyes && \
(flatpak remote-delete fedora --force || true) && \
(flatpak remote-modify --disable fedora || true) && \
flatpak install --system flathub --assumeyes com.brave.Browser org.gnome.baobab org.gnome.Calculator org.gnome.Calendar org.gnome.Characters org.gnome.clocks org.gnome.Contacts org.gnome.Connections org.gnome.font-viewer org.gnome.FileRoller org.gnome.Papers org.gnome.SimpleScan org.gnome.Snapshot org.gnome.TextEditor io.missioncenter.MissionCenter org.gnome.Showtime org.gnome.Loupe com.github.neithern.g4music com.mattjakeman.ExtensionManager page.codeberg.libre_menu_editor.LibreMenuEditor page.tesk.Refine page.tesk.Refine && \
rpm-ostree install --allow-inactive openssl || true && \
printf '\u2714\ufe0f Configuração concluída com sucesso no Fedora Silverblue!\n\U0001f501 Reinicie a máquina para aplicar as mudanças.\n'
```


## **1. Repositórios adicionais**

No meu caso o repositório RPM Fusion não é necessário, pois além da minha máquina ser "full AMD" (os drivers já estão no kernel Linux), a minha prioridade de uso de aplicações no Silverblue é de Flatpaks.

1. **Flatpak/Flathub** já vem com codecs proprietários por padrão.
2. **Toolbox/Distrobox** quando não há Flatpak, use `dnf install <pacote>` em container.
3. **rpm-ostree install pacote** só para pacotes realmente essenciais ao sistema que a opção **1** e **2** não substitui.

A necessidade de **habilitar o RPMFusion** é quando precisar drivers ou codecs proprietários no próprio sistema-base (ex.: NVIDIA, GStreamer, ffmpeg para apps nativos (desnecessário se usar Flatpak Flathub). 

### Habilitar repositórios

1. Habilitar manualmente dentro do GNOME Software:
   
`GNOME Software > Menu principal > Repositórios de Programas`

Habilita:

- Flathub (Flatpak)

Habilita se necessário:
- RPM Fusion

2. Reiniciar para aplicar as mudanças.


## **2. Substituir Flatpaks Fedora por Flatpak do Flathub**
**(não precisa fazer este passo se já executou o Comando Automático acima)**

O Fedora inclui seu próprio repositório Flatpak, mas os apps não tem todos os codecs necessários por questões de licenças. Remova os Flatpaks do Fedora e instale apenas do Flathub que já vem com todos os Codecs por padrão.

### **Remova todos os Flatpaks do Fedora:** 

```bash
flatpak uninstall --all --delete-data --assumeyes
flatpak remote-delete fedora --force
flatpak remote-modify --disable fedora  # (opcional, desativa sem remover)
```

### **Instale os Aplicativos do Flathub (base no GNOME Core)**  

Agora, vamos reinstalar as aplicações Flatpak do Flathub com comando a seguir usando o parâmetro padrão `--system`: 

```bash
flatpak install --system flathub --assumeyes \
com.brave.Browser \
org.gnome.baobab \
org.gnome.Calculator \
org.gnome.Calendar \
org.gnome.Characters \
org.gnome.clocks \
org.gnome.Contacts \
org.gnome.Connections \
org.gnome.font-viewer \
org.gnome.FileRoller \
org.gnome.Logs \
org.gnome.Loupe \
org.gnome.Maps \
org.gnome.Papers \
org.gnome.SimpleScan \
org.gnome.Snapshot \
org.gnome.TextEditor \
org.gnome.Weather \
com.github.neithern.g4music \
io.github.celluloid_player.Celluloid \
com.mattjakeman.ExtensionManager \
page.tesk.Refine
```



### **Aplicativos Adicionais Recomendados**

- **Refine (tweaks)**: ajustes do GNOME em ícones, temas, fontes e outros
- **Menu Principal**: permite editar os atalhos do menu do sistema
- **DistroShelf**: interface gráfica para gerenciar containers do Distrobox
 
```bash
flatpak install --system flathub --assumeyes --noninteractive page.tesk.Refine page.codeberg.libre_menu_editor.LibreMenuEditor com.ranfdev.DistroShelf
```


## **3. Extensões do GNOME sugeridas**  

Abra o **Gerenciador de Extensões** e instale:  
- **Dash to Dock** (dock similar ao macOS e elemetary OS)
- **Dash to Panel** (barra de tarefas similar ao Windows, KDE Plasma)  
- **Caffeine** (não deixa a máquina suspender)  
- **Clipboard Indicator** (gerenciador de copiar-colar)  
- **GSConnect** (integração com Android/KDE Connect)  
  - GSConnect precisa do **openssl** para funcionar:
  ```bash
  rpm-ostree install --allow-inactive openssl
  ```

## **4. Toolbox para criar containers (Fedora, Debian, Ubuntu, Arch linux, openSUSE)**

No Fedora Silverblue, o [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) é uma a ferramenta nativa usada para criar e entrar em containers que servem como ambientes isolados para instalar e usar ferramentas, sem afetar o sistema base imutável. Dentro da Toolbox você pode usar **diversas Distros Linux** (Fedora, Debian, Ubuntu, Arch linux, openSUSE e demais sistemas Linux) com seus respectivos gerenciadores de pacotes. E se algo der errado, é só deletar o container e criar outros, mantendo o sistema base limpo e estável.

O uso básico da Toolbox é o seguinte:

1. Criar uma toolbox (container) com o sistema base do host (Fedora Silverblue):
```
toolbox create
```
Esse comando cria um container com a mesma versão do Fedora do sistema host.

2. Criar uma toolbox com uma versão específica do Fedora:
```
toolbox create --release <versão>
```
Exemplo: `toolbox create --release f41` cria container com Fedora 41.

3. Nomear um container para criar várias toolboxes:
```
toolbox create --container <nome> --release <versão>
```
Exemplo: `toolbox create --container fedora41 --release f41`

4. Entrar em uma toolbox existente para usar o ambiente containerizado:
```
toolbox enter
```
Ou para um container específico:
```
toolbox enter <nome>
```

5. Listar containers criados:
```
toolbox list
```



## **5. Instalar o Distrobox no Silveblue (opcional)**

O [Distrobox](https://github.com/89luca89/distrobox) é bem similar ao Toolbox, mas tem algumas funcionalidades adicionais. Entre elas, destaca-se a opção `-assemble create --file`, permitindo criar múltiplos containers simultaneamente. Outra funcionalidade importante é a possibilidade de **inicializar serviços via systemd**, como por exemplo no comando `distrobox create --name ubuntu --init --image ubuntu:latest`, proporcionando melhor integração com o sistema hospedeiro. Além disso, o Distrobox facilita a exportação de atalhos para o menu de aplicativos do sistema.

Instalar o Distrobox:

```bash
rpm-ostree install distrobox
```

Reinicie o sistema para o Silverblue concluir a instalação.


### **Gerenciar Containers com DistroShelf**

O **DistroShelf** é uma Interface gráfica que facilita o gerenciamento de containers do Distrobox para instalar, clonar, remover, inicializar serviços com o Systemd, e ainda adicionar atalhos no menu de aplicativos do Silverblue (host).

**Selecione o terminal no DistroShelf**

O terminal padrão do Fedora Silverblue é o Ptyxis. Para o DistroShelf abrir automaticamente o terminal quando solicitado, faça:

`DistroShelf > ... > Configurações > selecione: Ptyxis terminal`

Observação:
> o Distrobox pode gerenciar os containers pelo terminal sem necessidade de aplicações gráficas. Veja a [documentação](https://github.com/89luca89/distrobox) oficial.


### Containers no Distrobox

![Fedora no Distrobox](https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/fedora-distrobox-2025-08-20%2011-56-12.png)

Como exemplo, podemos criar um container do **Fedora 41** `quay.io/fedora/fedora-toolbox:41` pelo DistroShelf. 
No terminal do container, podemos adicionar os repositórios extras do Fedora e usar o gerenciador de pacotes **dnf**.

**Habilite o repositórios RPM Fusion no seu Container Fedora**

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
 ```

## **6. Rollback do Sistema** 

No Fedora Silverblue (Kinoite e outros atômicos do Fedora), caso queira reverter alguma atualização, temos a opção de fazer **rollback** para uma versão anterior do sistema, garantindo segurança e praticidade quando precisar.

Para fazer Rollback de alguma atualização, siga os passos:

1. Reinicie o sistema e no menu de boot do Fedora Silverblue, selecione a versão anterior do sistema que termina com `(ostree:1)`:

![captura de tela - menu de boot silverblue](https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/menu-boot-silverblue.png)

2. Quando o sistema concluir de inicializar, abra o terminal e digite:

```bash
sudo rpm-ostree rollback
```

Esse comando restaura o deployment anterior e aplica na próxima reinicialização.

3. Reinicie o sistema para carregar a versão anterior:

```bash
sudo systemctl reboot
```

Assim, o Fedora Silverblue volta para a versão anterior do sistema de forma simples e segura.


## **7. Nvidia Driver**

O link a seguir é um guia atualizado para **instalar o driver NVIDIA** no Fedora Atômico (Silverblue, Kinoite e etc), substituindo os drivers Nouveau de código aberto. 

[Installing NVIDIA Drivers on Fedora Atomic](https://github.com/Comprehensive-Wall28/Nvidia-Fedora-Guide?tab=readme-ov-file#installing-nvidia-drivers-on-fedora-atomic)

Lembre-se: se algo der errado, você pode reverter as mudanças para uma versão anterior do sistema facilmente com um rollback, conforme explicado no tópico anterior.


## **8. Outras Configurações Úteis**

### **Integrar tema GTK + Flatpak**

Referência: https://github.com/lassekongo83/adw-gtk3

**1. Instalar o tema no sistema-base (para apps não-Flatpak):**

```bash
sudo rpm-ostree install adw-gtk3-theme
```

**2. Instalar o tema também no Flathub (para apps Flatpak):**

```bash
flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
flatpak update
```

**Ativar o tema no GNOME**

```bash
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3-dark
```

Escolha o tema pelo **Refine** ou com o comando:

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
```


## **9. Comandos essenciais para Silverblue**

Como o Fedora Silverblue foi projetado para ser um sistema 'inquebrável' e imutável (atômico), os comandos a seguir devem ser usados apenas para conhecimento ou em situações de última instância.

| Comando                         | Descrição                                                       |
| ------------------------------- | --------------------------------------------------------------- |
| `rpm-ostree upgrade`            | Busca e prepara atualizações da imagem do sistema               |
| `rpm-ostree status`             | Mostra a versão atual e atualizações pendentes                  |
| `rpm-ostree install <pacote>`   | Instala um pacote                                               |
| `rpm-ostree uninstall <pacote>` | Remove um pacote                                                |
| `rpm-ostree cleanup -m`         | Limpa versões antigas do sistema                                |
| `systemctl reboot`              | Reinicia o sistema (necessário após atualizações do rpm-ostree) |
| `rpm-ostree cancel`             | Cancela uma transação pendente (ex: atualização travada)        |
| `rpm-ostree rollback`           | Reverte para uma versão anterior do sistema             |



### **💡 Dicas Importantes**

1. Deixe o Silverblue cuidar das atualizações sem preocupação. No GNOME Software, habilite **Automático** em Atualizações de programas.  
2. Prefira **Flatpaks** a overlays (`rpm-ostree install`) para manter o sistema imutável.  
3. Use container com [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) ou [Distrobox](https://github.com/89luca89/distrobox) para instalar com `dnf install` ou pacotes RPM (além de outros formatos) que não tem em Flatpak.
4. Se você quiser um sistema Linux "pronto para uso" para jogos, com drivers Nvidia e Distrobox já instalado, o [Bazzite](https://bazzite.gg) é uma ótima opção. O sistema é baseado no Fedora Silverblue e oferece fácil acesso à jogos via Steam e Lutris, opção de drivers Nvidia com praticidade desde a instalação.

## Links úteis para Fedora Silverblue 

- [Distrobox Auto-Upgrade Containers](https://github.com/diogopessoa/distrobox-container-auto-upgrade)
- [Guia oficial Fedora Silverblue](https://docs.fedoraproject.org/pt_BR/fedora-silverblue/)
- [Fedora Desktops Atômicos](https://fedoraproject.org/pt-br/atomic-desktops/)
- [Telegram - Comunidade Fedora Brasil](t.me/comunidadefedorabrasil)
- [YouTube - Toolbox no Fedora: Crie Ambientes Isolados para Suas Aplicações](https://www.youtube.com/watch?v=t-VuQoQp4gg)


