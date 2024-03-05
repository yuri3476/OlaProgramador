import 'package:flutter/material.dart';

class BookstoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros'),
        backgroundColor: Color.fromARGB(255, 215, 197, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 215, 197, 251),
              Color.fromARGB(255, 248, 247, 250)
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
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Explore nossa biblioteca 📚',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 1: Algoritmos e Lógica da Programação',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 2: Arquitetura limpa: o guia do artesão para estrutura e design de software',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 3: Pense em Python: Pense Como um Cientista da Computação',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 4: Código Limpo: Habilidades práticas do Agile Software',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 5: Entendendo algoritmos: um guia ilustrado para programadores e outros curiosos',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: const Color.fromARGB(255, 57, 53, 53)),
                title: Text(
                  'Livro 6: 14 hábitos de desenvolvedores altamente produtivos',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              // Adicione mais exemplos de livros conforme necessário

              // Pode adicionar mais elementos aqui, como botões, imagens, etc.
            ],
          ),
        ),
      ),
    );
  }
}
