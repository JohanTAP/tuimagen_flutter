import 'package:flutter/material.dart';
import 'package:tuimagen_flutter/controllers/main_controller.dart';
import 'package:tuimagen_flutter/widgets/app_bar.dart';
import 'package:tuimagen_flutter/widgets/drawer.dart';
import 'package:tuimagen_flutter/widgets/search_anchor.dart';

class VistaPrincipal extends StatelessWidget {
  // Controlador principal para la vista
  final MainController controlador = MainController();

  VistaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Desactivar la bandera de depuración en la esquina superior derecha
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Barra de aplicaciones
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(),
        ),
        // Cajón de navegación lateral
        drawer: MyDrawer(
          drawerItems: controlador.drawerItems,
          onDrawerItemTap: controlador.onDrawerItemTap,
        ),
        // Cuerpo de la aplicación centrado
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: MiAnclaDeBusqueda(),
          ),
        ),
      ),
    );
  }
}
