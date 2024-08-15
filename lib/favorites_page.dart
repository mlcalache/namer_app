import 'package:flutter/material.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: ElevatedButton.icon(
              onPressed: () {
                appState.removeFavorite(pair);
              },
              icon: Icon(Icons.favorite),
              label: Text('Like'),
            ),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
