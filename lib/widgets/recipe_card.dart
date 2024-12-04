import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

import '../screens/recipe_details_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(recipe.imageUrl),
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(recipe: recipe),
            ),
          );
        },
      ),
    );
  }
}
