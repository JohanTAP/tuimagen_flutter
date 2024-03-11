import 'package:flutter/material.dart';

class MySearchAnchor extends StatelessWidget {
  const MySearchAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<Widget>.generate(
          5,
          (int index) {
            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text('Initial list item $index'),
            );
          },
        );
      },
    );
  }
}
