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
                'https://www.nintendo.com/pt-br/store/products/outer-wilds-switch/?srsltid=AfmBOor3Lv20FxPEmkfqfycWKPFpwq-uq2MXz53OE06Do__2l16ADpHw',
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
