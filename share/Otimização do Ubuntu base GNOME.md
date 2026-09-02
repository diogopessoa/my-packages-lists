---
tags:
  - linux
  - ubuntu
---

# Otimização para Ubuntu e Zorin OS para PC antigo

## Script Básico

```bash
#!/usr/bin/env bash

# Author: Diogo Pessoa
# Target: Ubuntu 25.04+; Zorin OS 18

set -euo pipefail

# ---------------- Verificação ----------------
if [[ $EUID -eq 0 ]]; then
    echo "Run this script as a standard user: ./install.sh"
    exit 1
fi

# ---------------- Colors ----------------
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

# ---------------- Sudo Keep-alive ----------------
sudo -v

while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# ---------------- Status Variables ----------------
status_network="${RED} ✗${NC}"
status_snapd="${RED} ✗${NC}"
status_swappiness="${RED} ✗${NC}"

# 1. ---------------- Update APT repositories ----------------
echo -e "\n▶ Updating APT package lists..."
sudo apt update

# 2. ---------------- Remove Snap ----------------
echo -e "\n▶ Removing Snap and snapd..."

if sudo apt remove --purge -y snapd; then
    sudo rm -rf /snap
    sudo rm -rf /var/snap
    sudo rm -rf /var/lib/snapd
    rm -rf "$HOME/snap"

    status_snapd="${GREEN} ✓${NC}"
fi

# 3. ---------------- Disable Network wait-online ----------------
echo -e "\n▶ Disabling NetworkManager-wait-online.service..."

if sudo systemctl disable NetworkManager-wait-online.service 2>/dev/null; then
    status_network="${GREEN} ✓${NC}"
fi

# 4. ---------------- Set Swappiness ----------------
echo -e "\n▶ Setting vm.swappiness=10..."

SWAPPINESS_CONF="/etc/sysctl.d/99-swappiness.conf"

# Remove linhas anteriores de vm.swappiness nesse arquivo (se houver)
if sudo test -f "$SWAPPINESS_CONF"; then
    sudo sed -i '/^vm\.swappiness=/d' "$SWAPPINESS_CONF" || true
fi

# Adiciona a nova configuração
if echo 'vm.swappiness=10' | sudo tee -a "$SWAPPINESS_CONF" >/dev/null; then
    # Aplica imediatamente (ignora erros se o kernel não permitir)
    sudo sysctl -p "$SWAPPINESS_CONF" 2>/dev/null || true
    status_swappiness="${GREEN} ✓${NC}"
fi

# 5. ---------------- Summary ----------------
echo -e "\n▶ Summary:"
echo -e " $status_network NetworkManager-wait-online disabled"
echo -e " $status_snapd Snap and snapd removed"
echo -e " $status_swappiness vm.swappiness set to 10"

echo ""
echo -e "${BLUE}${BOLD}Restart the system to apply all changes.${NC}"
read -rp "Press Enter to close..."
echo ""
``` 

## 1. Recomendação de Memória Virtual zRAM

### Configurar zRAM no Ubuntu base

Link: [Zram](https://github.com/diogopessoa/ubuntu-zram-setup)


---

## 2. Otimizações de Software e Pacotes (Ubuntu Base)

Remover os seguintes pacotes reduz a carga em background e libera RAM, o que é vital para melhora de desempenho.

**Pacotes Desnecessários (Remoção Segura):**

|**Funcionalidade**|**Pacote(s) a Remover**|**Comando de Exemplo**|
|---|---|---|
|**Relatórios de Erros**|`apport`, `apport-symptoms`|`sudo apt remove --purge apport apport-symptoms`|
|**Provisionamento em Nuvem**|`cloud-init`|`sudo apt remove --purge cloud-init`|
|**Monitoramento de Arquivos**|`zeitgeist`|`sudo apt remove --purge zeitgeist`|
|**Notificações de Reinício**|`needrestart`|`sudo apt remove --purge needrestart`|
|**Contas Online (Se não usar)**|`gnome-online-accounts`|`sudo apt remove --purge gnome-online-accounts`|
|**Sistema de Pacotes Snap**|`snapd`|`sudo apt remove --purge snapd`|
|**Limpeza Geral**|Dependências antigas|`sudo apt autoremove`|

### Desativação de Serviços em Background

Estes serviços podem causar lentidão no boot e durante o uso:

1. **Atualizações Automáticas em Background:**
    
    Bash
    
    ```
    # Remove o pacote de atualização automática
    sudo apt remove --purge unattended-upgrades
    # Desativa os timers diários de verificação (se o pacote acima não remover)
    sudo systemctl disable apt-daily.timer
    sudo systemctl disable apt-daily-upgrade.timer
    ```
    
2. **Espera pela Rede no Boot:**
    
    Bash
    
    ```
    # Impede que o boot espere a rede estar 100% ativa
    sudo systemctl disable systemd-networkd-wait-online.service
    ```


---

## 3. Otimizações do Ambiente Gráfico (GNOME)

O Zorin OS utiliza uma interface pesada, então otimizar os recursos visuais é a melhor forma de aliviar o seu Pentium Dual-core.

1. **Zorin Appearance (Aparência Zorin):**
    
    - Vá nas configurações de **Aparência Zorin**.
        
    - Selecione o **Layout** mais leve, que geralmente é o que imita a interface do Windows mais clássica ou a do GNOME padrão.
        
    - **Desative Efeitos Visuais e Transparências:** Procure opções como "Transparência do painel", "Animações da janela" ou "Efeitos de desktop" e desative-as ou defina-as para o mínimo. Isso reduz a carga da CPU e da GPU integrada.
        
2. **Desativar o Zeitgeist (Se não foi removido):**
    
    - Se você não removeu o pacote, desative o rastreamento do histórico de atividades que o Zeitgeist faz, pois consome CPU e I/O.
        
3. **Controle de Programas de Inicialização:**
    
    - Vá em **Aplicativos de Inicialização** (Startup Applications) no menu.
        
    - Desmarque **tudo** que não é essencial para o sistema (ex: mensageiros, verificadores de nuvem, ferramentas de captura de tela que iniciam automaticamente).
        
4. **Navegador Web:**
    
    - O navegador é o maior consumidor de RAM e CPU.
        
    - Ative a opção para suspender abas inativas e liberar RAM nos navegadores de internet.
        
    - Considere navegadores mais leves se o uso for básico, como: **Firefox** costuma ser mais amigável ou vá para o **Brave** que possível ajustes para reduzir o consumo de recursos.
        

---

## 4. Otimização da memória virtual

Ajustar o `vm.swappiness` é **crucial** para o desempenho em máquinas com menos de 8GB de RAM, apenas de o armazenamento for HDD. Caso seja SSD, a swappiness=60 padrão é a melhor configuração.



**Verifique o valor atual:**

```bash
   cat /proc/sys/vm/swappiness
```

1. **Defina Swappiness para 10:**
    
    Bash
    
    ```
    sudo nano /etc/sysctl.d/99-swappiness.conf
    ```
    
2. Adicione a linha abaixo no arquivo e salve:
    
    ```
    vm.swappiness=10
    ```
    
3. Aplique a configuração imediatamente:
    
    Bash
    
    ```
    sudo sysctl -p
    ```
    

## 5. Navegador padrão para abrir arquivos

Em Configurações de Aplicativos padrão, selecionar o navegador padrão (Brave por exemplo) para abrir: PDF, músicas, vídeo. Isso evita ter que executar vários programas e aumentar o consumo de RAM.

✅️ Pronto. As mudanças entrarão em vigor após a reinicialização.
