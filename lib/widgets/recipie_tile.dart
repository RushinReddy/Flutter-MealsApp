import 'package:flutter/material.dart';
import 'package:meals_app/screens/recipie_details_screen.dart';

import '../models/meal.dart';

class RecipieTile extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  RecipieTile({
    @required this.id,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.title,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return 'N/A';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return 'N/A';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipieDetailsScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.all(10),
                    width: 500,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        fontSize: 20,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$duration mins",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        affordabilityText,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
