# Atividade Prática — Flutter

Meu **primeiro contato com Flutter**: app simples sobre o jogo *Outer Wilds*, feito para praticar widgets, tema Material 3 e mudança de estado na tela.

## O app

- **MaterialApp** com tema (`ColorScheme.fromSeed`) e `DevicePreview` para testar em diferentes tamanhos de tela
- **StatefulWidget** — texto sobre o jogo que muda ao tocar em "Ver detalhes" (`setState`)
- **Layout** — `Scaffold`, `AppBar`, `Card`, `Image.network`, `Column`, `Padding` e `ElevatedButton`

Código principal em `lib/main.dart`.

## Como executar

```bash
flutter pub get
flutter run
```

---

## Questionário 1

**1. Widget Image** — Qual é a diferença entre `Image.network` e `Image.asset`?

- **Image.asset:** carrega imagens guardadas localmente no projeto. Ideal para logos e ícones fixos.
- **Image.network:** busca imagens por URL na internet. Usado para conteúdo dinâmico.

**2. Widget Column** — `mainAxisAlignment` e `crossAxisAlignment`

- **mainAxisAlignment:** alinhamento no eixo vertical (topo, centro, espaçamento).
- **crossAxisAlignment:** alinhamento no eixo horizontal (esquerda, centro, esticar).

**3. Widget Padding** — Por que usar Padding?

Oferece espaçamento preciso e consistente em qualquer tela. Espaços vazios no texto variam com fonte e dispositivo.

**4. StatelessWidget** — Quando usar?

Quando o conteúdo é fixo e não muda após ser desenhado. "Sem estado" = o widget não guarda mudanças internas de aparência por conta própria.

---

## Questionário 2

**1. Por que usar StatefulWidget?**

A tela deixa de ser estática: precisa reagir ao botão e atualizar o texto na interface.

**2. O que muda ao pressionar o botão?**

O texto da variável `mensagem` (sinopse do jogo → frase sobre Outer Wilds).

**3. Qual variável é alterada no `setState()`?**

A variável `mensagem`.

**4. O que o `setState()` faz?**

Atualiza o valor e avisa o Flutter para reconstruir os widgets da tela com o novo conteúdo.

**5. E se alterar a variável sem `setState()`?**

O valor muda na memória, mas a tela continua mostrando o texto antigo — a interface não se redesenha.
