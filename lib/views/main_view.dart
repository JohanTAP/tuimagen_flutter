import 'package:flutter/material.dart';
import 'package:tuimagen_flutter/controllers/main_controller.dart';
import 'package:tuimagen_flutter/widgets/app_bar.dart';
import 'package:tuimagen_flutter/widgets/drawer.dart';
import 'package:tuimagen_flutter/widgets/search_anchor.dart';

class MainView extends StatelessWidget {
  final MainController controller = MainController();

  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(), // Usar el nuevo widget del AppBar
        ),
        drawer: MyDrawer(
          drawerItems: controller.drawerItems,
          onDrawerItemTap: controller.onDrawerItemTap,
        ), // Usar el nuevo widget del Drawer
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: MySearchAnchor(), // Usar el nuevo widget del SearchAnchor
          ),
        ),
      ),
    );
  }
}
