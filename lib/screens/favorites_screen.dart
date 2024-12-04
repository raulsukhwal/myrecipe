import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/recipe_bloc.dart';
import '../blocs/recipe_state.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          return state.favorites.isEmpty
              ? Center(child: Text('No favorites yet.'))
              : ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return RecipeCard(recipe: state.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
