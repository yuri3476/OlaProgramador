import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _Challenge {
  String title;
  String description;
  int pontuacao;
  bool concluido;

  _Challenge(this.title, this.description, this.pontuacao, this.concluido);
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  int pontuacaoTotal = 0;
  int trofeusGanhos = 0;

  List<_Challenge> desafios = [
    _Challenge('Desafio 1: Hello World', 'Imprima "Olá, Mundo!" na tela.', 50, false),
    _Challenge('Desafio 2: Soma Simples', 'Escreva um programa que soma dois números inteiros.', 75, false),
    _Challenge('Desafio 3: Cálculo Média', 'Escreva um programa que calcule a média de dois números inteiros.', 90, false),
    // Adicione mais desafios conforme necessário
  ];

  void _concluirDesafio(_Challenge desafio) {
    if (!desafio.concluido) {
      int pontuacaoDesafio = calcularPontuacaoComBaseNoTempo();
      pontuacaoTotal += pontuacaoDesafio;

      if (pontuacaoDesafio >= 100) {
        trofeusGanhos++;
      }

      desafio.concluido = true;
      setState(() {});
    }
  }

  int calcularPontuacaoComBaseNoTempo() {
    // Implemente sua lógica para calcular a pontuação com base no tempo
    return 100;
  }

  Widget _buildChallenge(_Challenge desafio) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              desafio.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              desafio.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _concluirDesafio(desafio);
              },
              child: Text(desafio.concluido ? 'Desafio Concluído' : 'Concluir Desafio'),
              style: ElevatedButton.styleFrom(
                primary: desafio.concluido ? Colors.grey : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafios'),
        backgroundColor: Color.fromARGB(255, 215, 197, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 215, 197, 251),
              Color.fromARGB(255, 248, 247, 250),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Center(
                child: Text(
                  'Explore nossos Desafios Diários 👨🏽‍💻',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Pontuação Total: $pontuacaoTotal Troféus: $trofeusGanhos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              // Exemplo de Desafio 1
              _buildChallenge(desafios[0]),
              // Exemplo de Desafio 2
              _buildChallenge(desafios[1]),
              // Adicione mais desafios conforme necessário
              _buildChallenge(desafios[2]),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChallengesScreen(),
  ));
}
