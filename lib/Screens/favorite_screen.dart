import 'package:flutter/material.dart';
import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if (favoriteMeals.isEmpty){
      return Center(
        child: Text(
          "You don't have favorites ",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    else{
        return ListView.builder(
            itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            title: favoriteMeals[index].title,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
            },
          itemCount:favoriteMeals.length,
        );
    }



  }
}
