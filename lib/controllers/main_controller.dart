import 'package:flutter/material.dart';
import 'package:tuimagen_flutter/models/drawer_item.dart';

class MainController {
  final List<DrawerItem> drawerItems = [
    DrawerItem(title: 'Inicio', icon: Icons.home),
    DrawerItem(title: 'Configuración', icon: Icons.settings),
  ];

  void onDrawerItemTap(int index) {
    // Lógica para manejar la selección del ítem del Drawer
  }
}
