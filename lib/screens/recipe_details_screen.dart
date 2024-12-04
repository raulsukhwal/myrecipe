import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/recipe_model.dart';
import '../blocs/recipe_bloc.dart';
import '../blocs/recipe_event.dart';
import '../blocs/recipe_state.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              final isFavorite = state.favorites.any((fav) => fav.id == recipe.id);

              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  BlocProvider.of<RecipeBloc>(context).add(ToggleFavorite(recipe.id));
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                recipe.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),

            // Recipe Title
            Text(
              recipe.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Recipe Description
            Text(
              recipe.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16.0),

            // Ingredients Section
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.circle, size: 10),
                  title: Text(recipe.ingredients[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
