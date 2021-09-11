import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Hard,
  Challenging,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isVegan;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isVegetarian,
    @required this.isLactoseFree,
    @required this.isVegan});
}

