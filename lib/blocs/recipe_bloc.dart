import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_event.dart';
import 'recipe_state.dart';
import '../models/recipe_model.dart';

final List<Recipe> hardcodedRecipes = [
  Recipe(
    id: "1",
    title: "Pasta",
    description: "A classic Italian pasta dish made with creamy,cheese texture, cheese, pancetta, and pepper.",
    imageUrl: "https://www.yummytummyaarthi.com/wp-content/uploads/2022/07/italian-pasta-1.jpeg",
    ingredients: ["Spaghetti", "Cheese", "Pancetta", "Black Pepper" , "Veggies"],
  ),
  Recipe(
    id: "2",
    title: "Sambhar Curry",
    description: "Sambar is a South Indian,vegetable stew made with pigeon pea lentils, tamarind, and a unique spice blend called sambar powder.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPIz66wZjByNZpcgiO-GAUsXm9BLqkoX142Q&s",
    ingredients: ["Lentil", "Onions", "Tomatoes", "Garlic", "Spices","tamarind"],
  ),
  Recipe(
    id: "3",
    title: "Vegetable Mix",
    description: "A healthy mix of vegetables stir-fried with soy sauce and garlic.",
    imageUrl: "https://www.thespruceeats.com/thmb/ch01iX_JAbTHwbv26QuL1kupeXQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/SES-mixed-vegetable-curry-1957913-03048999db714405bfe8614c975b8a44.jpg",
    ingredients: ["Broccoli", "Carrots", "Bell Peppers", "Garlic", "Soy Sauce"],
  ),
];

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeState.initial()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onLoadRecipes(LoadRecipes event, Emitter<RecipeState> emit) {
    // Ensure recipes are loaded when the LoadRecipes event is triggered
    emit(state.copyWith(recipes: hardcodedRecipes));
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<RecipeState> emit) {
    // Ensure that recipes have been loaded
    if (state.recipes.isEmpty) {
      print('Recipes have not been loaded yet.');
      return;
    }

    final isFavorite = state.favorites.any((recipe) => recipe.id == event.recipeId);

    if (isFavorite) {
      // Remove from favorites
      emit(state.copyWith(
        favorites: state.favorites.where((recipe) => recipe.id != event.recipeId).toList(),
      ));
    } else {
      // Find the recipe and add to favorites
      final recipe = state.recipes.firstWhere(
            (recipe) => recipe.id == event.recipeId,
        orElse: () => Recipe(id: "0", title: 'Not Found', description: 'No recipe found', imageUrl: '', ingredients: []), // Default empty recipe
      );

      if (recipe.id != 0) { // Check if recipe was found
        emit(state.copyWith(favorites: [...state.favorites, recipe]));
      } else {
        // Handle the case where no valid recipe was found
        print('Recipe with ID ${event.recipeId} not found.');
      }
    }
  }
}
