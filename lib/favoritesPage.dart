import 'package:flutter/material.dart';
import 'package:iguesflut_23/appState.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    if (appState.favorites.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(25),
        child: Text("Nenhuma palavra escolhida ainda"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
              "Você tem ${appState.favorites.length} palavras escolhidas",
              style: theme.textTheme.titleMedium),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.star),
            title: Text("${pair.first} ${pair.second}"),
          )
      ],
    );
  }
}
