import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'listar_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Pequeno Grimório',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Configuração de rotas
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/listar': (context) => const ListarWidgetScreen(),
      },
    );
  }
}
