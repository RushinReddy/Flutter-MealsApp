import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/recipie_tile.dart';

class CategoryItemsScreen extends StatelessWidget {
  static const routeName = '/category-items';

  // @required
  // final String categoryId;
  // @required
  // final String categoryTitle;

  //({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    //routes and arguments

    final routeArguements =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArguements['categoryTitle'];
    final categoryId = routeArguements['categoryId'];

//where gives a boolean so mealsInCategory is a list (.toList())
//that contains elements of type Meal (as in the list DUMMY_MEALS), only those that contain categoryId
//in the categories list
    final mealsInCategory = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RecipieTile(
            id: mealsInCategory[index].id,
            affordability: mealsInCategory[index].affordability,
            complexity: mealsInCategory[index].complexity,
            duration: mealsInCategory[index].duration,
            imageUrl: mealsInCategory[index].imageUrl,
            title: mealsInCategory[index].title,
          );
        },
        itemCount: mealsInCategory.length,
      ),
    );
  }
}
