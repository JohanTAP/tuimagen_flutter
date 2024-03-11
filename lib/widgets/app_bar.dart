import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Fondo de color púrpura para la barra de aplicaciones
      backgroundColor: Colors.purple,
      // Centra el título en la barra de aplicaciones
      centerTitle: true,
      // Título de la aplicación con estilo de texto blanco
      title: const Text(
        'Tu Imagen',
        style: TextStyle(color: Colors.white),
      ),
      // Tema del ícono con color blanco
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
