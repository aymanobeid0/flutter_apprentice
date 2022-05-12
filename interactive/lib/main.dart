import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
        theme: theme,
        title: 'Fooderlich',
        // TODO 8: Replace this with MultiProvider
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TabManager()),
            // TODO 10: Add GroceryManager Provider
            ChangeNotifierProvider(create: (context) => GroceryManager()),
          ],
          child: const Home(),
        ));
  }
}
