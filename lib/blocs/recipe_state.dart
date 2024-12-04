import 'package:equatable/equatable.dart';
import '../models/recipe_model.dart';

class RecipeState extends Equatable {
  final List<Recipe> recipes;
  final List<Recipe> favorites;

  RecipeState({
    required this.recipes,
    required this.favorites,
  });

  factory RecipeState.initial() {
    return RecipeState(
      recipes: [],
      favorites: [],
    );
  }

  RecipeState copyWith({
    List<Recipe>? recipes,
    List<Recipe>? favorites,
  }) {
    return RecipeState(
      recipes: recipes ?? this.recipes,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props => [recipes, favorites];
}
