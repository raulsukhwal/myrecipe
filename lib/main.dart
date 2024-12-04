import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/recipe_bloc.dart';
import 'blocs/recipe_event.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeBloc()..add(LoadRecipes()),
      child: MaterialApp(
        title: 'Recipe Book',
        theme: ThemeData(primarySwatch: Colors.green),
        home: HomeScreen(),
      ),
    );
  }
}
