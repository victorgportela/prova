import 'package:flutter/material.dart';
import 'exemplo_widget.dart';

class ListarWidgetScreen extends StatelessWidget {
  const ListarWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usar o método estático para obter um livro de exemplo
    final exampleBook = Book.getExample();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Livros'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Meus Livros',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Usando o widget personalizado com o livro de exemplo e as informações adicionais
            ExemploWidget(
              book: exampleBook,
              publicationYear: "2019",
              genre: "Programação Dart",
              rating: 4.8,
            ),
          ],
        ),
      ),
    );
  }
}
