import 'package:flutter/material.dart';
import '../dummy_data.dart';




class MealDetailScreen extends StatelessWidget {

  static const routName = 'meal_detail';
  final Function toggleFavorites;
  final Function isFavorites;


  MealDetailScreen(this.toggleFavorites,this.isFavorites);


  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorites(mealId),
        child: Icon(
          isFavorites(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
