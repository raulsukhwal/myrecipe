import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/recipe_bloc.dart';
import '../blocs/recipe_state.dart';
import '../widgets/recipe_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(recipe: state.recipes[index]);
            },
          );
        },
      ),
    );
  }
}
