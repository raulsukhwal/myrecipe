class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
  });
}
