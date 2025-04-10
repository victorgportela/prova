import 'package:flutter/material.dart';

// Classe Book fornecida
class Book {
  final String title;
  final String author;
  final int pages;
  Book({
    required this.title,
    required this.author,
    required this.pages,
  });
  bool isLongBook() {
    return pages > 300;
  }
  static Book getExample() {
    return Book(
      title: 'The Dart Programming Language',
      author: 'Chris Buckett',
      pages: 350,
    );
  }
}

class ExemploWidget extends StatelessWidget {
  final Book book;
  // Informações adicionais que não estão na classe Book original
  final String publicationYear;
  final String genre;
  final double rating;

  const ExemploWidget({
    Key? key, 
    required this.book,
    this.publicationYear = "2018",  // Valor padrão para exemplo
    this.genre = "Programação",     // Valor padrão para exemplo
    this.rating = 4.5,              // Valor padrão para exemplo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.black54),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.person, 'Autor', book.author),
            _buildInfoRow(Icons.menu_book, 'Páginas', book.pages.toString()),
            _buildInfoRow(Icons.calendar_today, 'Ano', publicationYear),
            _buildInfoRow(Icons.category, 'Gênero', genre),
            _buildInfoRow(Icons.star, 'Avaliação', '$rating/5.0'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Livro favoritado!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Favoritar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper para construir as linhas de informação
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
