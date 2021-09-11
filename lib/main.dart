import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './Screens/favorite_screen.dart';
import './Screens/category_meals_screen.dart';
import './Screens/meal_detail_screen.dart';
import 'Screens/filters_screen.dart';
import 'Screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) =>meal.id == mealId );

    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) =>meal.id == mealId ));
      });
    }
  }


  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any(((meal) =>meal.id == id ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.teal,
          canvasColor: Color.fromRGBO(215, 243, 223, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                body2: TextStyle(
                  color: Color.fromRGBO(100, 120, 150, 1),
                ),
                body1: TextStyle(
                  color: Color.fromRGBO(150, 120, 150, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName: (context) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routName: (context) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
