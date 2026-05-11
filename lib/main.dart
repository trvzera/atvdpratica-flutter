import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  // O DevicePreview ajuda a testar o layout em diferentes tamanhos de tela (responsividade)
  runApp(DevicePreview(
    builder: (context) => MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Remove a faixa de "debug" do canto da tela
      theme: ThemeData(
        useMaterial3: true, // Ativa o design system mais moderno do Google
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary:
              Colors.redAccent, // Definindo uma cor secundária para usar no app
        ),
      ),
      home: TeladDesign(),
    );
  }
}

class TeladDesign extends StatelessWidget {
  // ATENÇÃO: Como este widget é StatelessWidget, mudar essa variável
  // não fará a tela atualizar visualmente (re-renderizar).
  var perguntaSelecionada = 0;

  void responder() {
    perguntaSelecionada++;
    print('Pergunta Respondida. Nova posição: $perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    // Buscando as cores do tema definido lá no MaterialApp (Boa prática!)
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      // Scaffold fornece a estrutura básica (Barra superior, corpo, etc)
      appBar: AppBar(
        title: const Text(
          'Perguntas',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
        backgroundColor: cores.secondary, // Usando a cor secundária do tema
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Usando componentes customizados para manter o código limpo
          const TextosPergunta('Qual animal é esse?'),

          // Image.network carrega imagens da internet
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtp80N9SQ201AAWwPu6TRqc7wOJ-0CB8jr8aA-APcIlh0akyufF9IMYXSCIEUkqr72xQuTngCOe_aXWewXyLeMUPwBHoyePbQdcm15VERS&s=10',
              height: 150,
              width: 150,
              fit:
                  BoxFit.cover, // Faz a imagem preencher o espaço sem distorcer
            ),
          ),

          // Chamando o widget de botão várias vezes com textos diferentes
          BotaoResposta('Cachorro'),
          BotaoResposta('Capivara'),
          BotaoResposta('Rato'),

          const SizedBox(height: 50), // Espaçamento vazio no final
        ],
      ),
    );
  }
}

// --- COMPONENTES SEPARADOS (CUSTOM WIDGETS) ---

class BotaoResposta extends StatelessWidget {
  final String texto;

  // 'super.key' ajuda o Flutter a rastrear o widget na árvore de elementos
  const BotaoResposta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Faz o botão ocupar a largura total disponível
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          // Aqui vai a lógica de quando o usuário clica
          print('Resposta escolhida: $texto');
        },
        child: Text(texto),
      ),
    );
  }
}

class TextosPergunta extends StatelessWidget {
  final String texto;

  const TextosPergunta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
