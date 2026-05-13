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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
          secondary: Colors.blueAccent,
        ),
      ),
      home: TeladDesign(),
    );
  }
}

class TeladDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Buscando as cores do tema definido lá no MaterialApp (Boa prática!)
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      // Scaffold fornece a estrutura básica (Barra superior, corpo, etc)
      appBar: AppBar(
        title: const Text(
          'Outer wilds',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
        backgroundColor: cores.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          child: Column(
            children: [
              Image.network(
                'https://store-images.s-microsoft.com/image/apps.54574.14143081164842053.3ed0ca8b-d0ca-48af-9431-74e141bdd9ff.00560713-e7ae-4d29-9dcd-98f2cde17d0a?q=90&w=480&h=270',
              ),
              Text(
                "Outer Wilds",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  "O jogo é sobre exploração espacial e loop temporal, onde você está preso nesse loop e precisa arrumar uma forma de descobrir o que está acontecendo."),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  print('Botão pressionado');
                },
                child: Text('Ver detalhes'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
