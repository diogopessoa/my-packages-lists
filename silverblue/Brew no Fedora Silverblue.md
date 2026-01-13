https://docs.projectbluefin.io/blog/easier-homebrew-installation-for-custom-images/

https://chatgpt.com/c/69643509-bb38-832b-a837-3e42ff4f761f

# Guia de instalção Homebrew

### Instalação do Homebrew no Fedora Silverblue (passo a passo direto)

---

## 1️⃣ Abrir um terminal no host

Use o terminal padrão do sistema (não Toolbox / Distrobox).

---

## 2️⃣ Rodar o instalador oficial

Execute **como usuário**, sem `sudo`:

```bash
HOMEBREW_FORCE_USER_INSTALL=1 \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Durante a execução:

* Aceite com **ENTER**
* Se pedir senha, informe a do usuário (é apenas para criar `/home/linuxbrew`)
* O local correto será:

  ```
  /home/linuxbrew/.linuxbrew
  ```

---

## 3️⃣ Verificar se instalou

Após concluir:

```bash
/home/linuxbrew/.linuxbrew/bin/brew --version
```

Se mostrar a versão do Homebrew, a instalação está correta.

---

## 4️⃣ Configurar o PATH (Fish)



---

## 5️⃣ Confirmar funcionamento

Verificar se foi instalado:

```
ls -l /home/linuxbrew/.linuxbrew/bin/brew
```

Verificar a versão:

```bash
which brew
brew --prefix
```

Saída esperada:

```
/home/linuxbrew/.linuxbrew/bin/brew
/home/linuxbrew/.linuxbrew
```

---

## 6️⃣ Teste rápido

```bash
brew install hello
hello
```

---

## 7️⃣ (Opcional) Criar Brewfile

```bash
mkdir -p ~/.config/brew
nano ~/.config/brew/Brewfile
```

Depois:

```bash
brew bundle --file ~/.config/brew/Brewfile
```

---

## Resumo final

* ✔️ Local correto: `/home/linuxbrew/.linuxbrew`
* ✔️ Compatível com Silverblue / Atomic
* ✔️ Sem interferir no rpm-ostree
* ✔️ Não usar Toolbox / Distrobox
* ✔️ Não mover o prefixo

Esse é o método **oficial, suportado e usado pelo Bluefin e Bazzite**.


Explicação técnica:

* `/home/linuxbrew` é **apenas o diretório-pai**
* O que importa é:

  ```
  /home/linuxbrew/.linuxbrew
  ```
* Esse **já pertence ao usuário Diogo** (como vimos nos logs)
* O Brew **não escreve** no diretório pai após criado

Esse layout é exatamente o mesmo usado em:

* uBlue Bluefin
* Bazzite
* Docs oficiais do Homebrew Linux



## 1) Layout ideal: Brew + Brewfile + Flatpak no Fedora Silverblue

A ideia central no Silverblue é separação clara de responsabilidades:

Host imutável → só o essencial do sistema

Flatpak → aplicações gráficas

Toolbox/Distrobox → ferramentas de desenvolvimento e CLI

Brew + Brewfile → camada declarativa e portátil dentro do container


### Arquitetura recomendada

HOST (Silverblue)
│
├── rpm-ostree
│   └── apenas drivers / firmware / casos excepcionais
│
├── Flatpak (Flathub)
│   └── apps gráficos (Firefox, Steam, VS Code, etc.)
│
└── Toolbox ou Distrobox
    │
    ├── DNF
    │   └── base mínima (gcc, glibc-devel, make, etc.)
    │
    └── Homebrew
        ├── brew install (CLI tools)
        └── Brewfile (estado declarativo)


---

## Organização prática no $HOME


~/
├── .config/
│   └── brew/
│       └── Brewfile
│
├── .local/bin/
│   └── toolbox-brew-update.sh
│
└── dotfiles/
    └── brew/
        └── Brewfile

Use um Brewfile único, versionado no Git.


---

## Exemplo de Brewfile “ideal” para Silverblue

```
# CLI tools (portáveis)
brew "bat"
brew "eza"
brew "fd"
brew "ripgrep"
brew "fzf"
brew "neovim"
brew "htop"
brew "jq"
brew "starship"

# Linguagens / runtimes
brew "node"
brew "python@3.12"
brew "go"

# Flatpaks (apps GUI)
flatpak "org.mozilla.firefox"
flatpak "com.visualstudio.code"
flatpak "org.gnome.Loupe"
flatpak "org.libreoffice.LibreOffice"
```

Fluxo:

brew bundle --file ~/.config/brew/Brewfile

Resultado:

CLI e runtimes → container

GUI → host (Flatpak)

Estado reprodutível em qualquer máquina



---


# Brew e atualização automática



## Github REAME-PT-br

# 🍺 Homebrew auto-update (Fedora Atomic)

Atualização automática do **Homebrew instalado no host**.

## O que faz
- Atualiza pacotes do Homebrew no host
- Timer e atualização semanal com notificação

## Pré-requisitos
- **Fedora atomic** Silverblue, Kinoite, Fedora COMISC Atomic...  
- **Homebrew instalado na pasta do usuário `/home/linuxbrew/.linuxbrew`.** ([veja como instalar](https://brew.sh/)

## Instalação

```bash
mkdir -p ~/.local/bin ~/.config/systemd/user

curl -fsSL https://raw.githubusercontent.com/diogopessoa/SEU_REPO/main/brew-update.sh \
  -o ~/.local/bin/brew-update.sh

curl -fsSL https://raw.githubusercontent.com/diogopessoa/SEU_REPO/main/brew-update.service \
  -o ~/.config/systemd/user/brew-update.service

chmod +x ~/.local/bin/brew-update.sh

systemctl --user daemon-reload
systemctl --user enable brew-update.service

### Teste na prática

```bash
# 1. copia para o terminal:
~/.local/bin/brew-update.sh

# 2. execute:
systemctl --user daemon-reload
systemctl --user start brew-update.service
```



## License
MIT

## Credits
- [Homebrew](https://brew.sh/)


## Github REAME main


# 🍺 Homebrew auto-update (Fedora Atomic)

Automatic update of **Homebrew installed on the host**.

## What does it do
- Updates Homebrew packages on the host
- Timer and weekly update with notification

## Prerequisites
- **Fedora atomic** Silverblue, Kinoite, Fedora COMISC Atomic...
- **Homebrew installed in the user folder `/home/linuxbrew/.linuxbrew`.** ([see how to install](https://brew.sh/)

## Installation

```bash
mkdir -p ~/.local/bin ~/.config/systemd/user

curl -fsSL https://raw.githubusercontent.com/diogopessoa/SEU_REPO/main/brew-update.sh \
  -o ~/.local/bin/brew-update.sh

curl -fsSL https://raw.githubusercontent.com/diogopessoa/SEU_REPO/main/brew-update.service \
  -o ~/.config/systemd/user/brew-update.service

chmod +x ~/.local/bin/brew-update.sh

systemctl --user daemon-reload
systemctl --user enable brew-update.service

### Test in practice

```bash
# 1. copy to terminal:
~/.local/bin/brew-update.sh
```


```bash
# 2. execute:
systemctl --user daemon-reload
systemctl --user start brew-update.service
```


## License
MIT

## Credits
- [Homebrew](https://brew.sh/)


