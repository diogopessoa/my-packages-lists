# Fixar Versão ou Deployment do Fedora Silverblue


No Fedora Silverblue (ou Kinoite e outros Fedora atômicos), o rpm-ostree possibilita fixar a versão do sistema. Ele não “trava pacotes individuais” como no Fedora Workstation. O sistema é **imutável** e baseado em _ostree_, então a versão é tratada em nível de _deployment_ inteiro (a imagem do sistema), não em pacotes separados. 


Vejamos como fixar uma versão específica no Silverblue. 

Existem dois cenários:


## 1. 📌 Fixar uma versão do Fedora

Veja qual versão você está usando:

```bash
rpm-ostree status
```

- `●` → indica o deployment ativo.

Normalmente aparece algo como:

`fedora:fedora/42/x86_64/silverblue`

Para fixar na versão atual (ex: 42)

```bash
sudo rpm-ostree rebase fedora:fedora/42/x86_64/silverblue
```

Assim você só recebe atualizações **dentro da versão 42**, sem saltar para o Fedora 43 quando for lançado.

### ↩️ Desfixar a versão atual (desfaz o comando anterior)

```bash
sudo rpm-ostree rebase fedora:fedora/x86_64/silverblue
```

Assim, quando sair a 43, o próximo `rpm-ostree upgrade` já oferece a nova release.



## 2. 📌 Fixar o deployment atual (imagem de implantação)


Outra forma é **pinar o deployment** atual para que ele não seja sobrescrito:

```bash
sudo ostree admin pin 0
```

Isso fixa o deployment atual (o índice `0` mostrado em `rpm-ostree status`). Ótimo se você precisa de um “estado seguro” do sistema.


### ↩️ Desfixar o deployment (desfaz o comando anterior)

```bash
sudo ostree admin unpin 0
```

Remove o _pin_ e deixa o snapshot ser limpo automaticamente quando novos deployments forem criados.



## Razões para fixar a versão

1. **Fixe no lançamento estável do Fedora** se quiser estabilidade e só atualize para o novo lançamento depois de 2–3 meses do lançamento.

2. **Sempre deixe um snapshot pinado** quando o sistema estiver funcionando bem (garante um ponto de restauração).

3. **Use `rollback` sem medo** — no Silverblue é seguro, porque nada quebra definitivamente.



