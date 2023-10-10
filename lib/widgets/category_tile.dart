import 'package:flutter/material.dart';

import '../screens/category_items_screen.dart';

class CategoryTile extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryTile({this.title, this.color, this.id});

  void onTapOnCategoryTile(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryItemsScreen.routeName,
      arguments: {
        'categoryId': id,
        'categoryTitle': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOnCategoryTile(context);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(91, 64, 122, 1), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
