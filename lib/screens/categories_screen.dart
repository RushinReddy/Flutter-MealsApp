import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_tile.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     'Meals and Stuff',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            child: GridView(
              padding: const EdgeInsets.all(20),
              children: DUMMY_CATEGORIES
                  .map((categoryData) => CategoryTile(
                        title: categoryData.title,
                        color: categoryData.color,
                        id: categoryData.id,
                      ))
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
