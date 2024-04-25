import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    if(appState.favorites.isEmpty){
      return Center(
        child: Text("No favorites yet."),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${appState.favorites.length} favorites:"),
        ),
        for(var pair in appState.favorites)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              color: theme.colorScheme.primary,
              child: ListTileTheme(
                textColor: theme.colorScheme.onPrimary,
                iconColor: theme.colorScheme.onPrimary,
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      appState.toggleFavorite(pair);
                    }, 
                  ),
                  title: Text(
                    pair.asLowerCase,
                  ),
                  onTap: (){
                    
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
