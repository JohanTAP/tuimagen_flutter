import 'package:flutter/material.dart';
import 'package:tuimagen_flutter/models/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  final List<DrawerItem> drawerItems;
  final Function(int) onDrawerItemTap;

  const MyDrawer(
      {super.key, required this.drawerItems, required this.onDrawerItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Menú principal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          for (int i = 0; i < drawerItems.length; i++)
            ListTile(
              leading: Icon(drawerItems[i].icon),
              title: Text(drawerItems[i].title),
              onTap: () {
                onDrawerItemTap(i);
              },
            ),
        ],
      ),
    );
  }
}
