import 'package:equatable/equatable.dart';
import '../models/recipe_model.dart';

abstract class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadRecipes extends RecipeEvent {}

class ToggleFavorite extends RecipeEvent {
  final String recipeId;

  ToggleFavorite(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}
