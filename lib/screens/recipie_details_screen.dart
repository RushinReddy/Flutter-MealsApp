import 'package:flutter/material.dart';

import 'package:meals_app/dummy_data.dart';
//import '../models/meal.dart';

class RecipieDetailsScreen extends StatelessWidget {
  //static const routeName = '/recipie-details';
  static const routeName = '/recipie-details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    final selectedRecipie =
        DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipie.title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              child: Image.network(
                selectedRecipie.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Ingredients",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            height: 150,
            child: ListView.builder(
                itemCount: selectedRecipie.ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                    child: Text(selectedRecipie.ingredients[index],
                        style: TextStyle(color: Colors.black)),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Procedure",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            height: 250,
            child: ListView.builder(
                itemCount: selectedRecipie.steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 0, 0),
                    child: Text(selectedRecipie.steps[index],
                        style: TextStyle(color: Colors.black)),
                  );
                }),
          ),
          // Container(
          //   height: 200,
          //   child: ListView.builder(
          //       itemCount: selectedRecipie.steps.length,
          //       itemBuilder: (context, index) {
          //         return Text(selectedRecipie.steps[index]);
          //       }),
          // )
        ],
      ),
    );
  }
}
