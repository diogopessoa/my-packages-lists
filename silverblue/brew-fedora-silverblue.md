# Homebrew - Guia de Instalação no Fedora Silverblue

## 1) Pré-requisitos

* Fedora Silverblue atualizado
* Shell Fish


## 2) Instalação do Homebrew (prefixo do host)

Execute no terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

No Fedora Atomic (uBlue/Bluefin/Bazzite), o instalador cria:

```
/home/linuxbrew/.linuxbrew
```

Esse é o **prefixo correto e recomendado** para o host.


## 3) Integração com Fish (meu caso)

Crie o snippet:

```fish
nano ~/.config/fish/conf.d/homebrew.fish
```

Conteúdo:

```fish
# Homebrew (Fedora Silverblue / Atomic)
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end
```

Carregue sem reiniciar:

```fish
source ~/.config/fish/conf.d/homebrew.fish
```

Valide:

```fish
which brew
brew --prefix
```

Saída esperada:

```
/home/linuxbrew/.linuxbrew/bin/brew
/home/linuxbrew/.linuxbrew
```


## 4) Uso básico (host)

Instalar ferramentas CLI:

```fish
brew install ripgrep fd bat eza htop
```

Atualizar tudo:

```fish
brew update
brew upgrade
brew cleanup
```

## 5) Brewfile (opcional, recomendado)

Crie:

```fish
nano ~/Brewfile
```

Exemplo mínimo:

```ruby
brew "ripgrep"
brew "fd"
brew "bat"
brew "eza"
```

Aplicar:

```fish
brew bundle --file=~/Brewfile
```

## 6) Manutenção automática 

### Atualização periódica manual simples:

```fish
brew update && brew upgrade && brew cleanup
```

### Atualização automática dos pacotes Homebrew

[🍺 Homebrew - Script Auto-Update](https://github.com/diogopessoa/brew-update) 

## Links Úteis
- https://docs.projectbluefin.io/blog/easier-homebrew-installation-for-custom-images/
- https://chatgpt.com/c/69643509-bb38-832b-a837-3e42ff4f761f



