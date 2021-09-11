import 'package:flutter/material.dart';
import '../Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 35, 0, 35),
        child: Container(
          color: Colors.white.withOpacity(0.6),
          child: Center(
            child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
