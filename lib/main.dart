import 'package:flutter/material.dart';

import 'screens/category_items_screen.dart';
import 'screens/recipie_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filterSettings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals and Stuff',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(28, 55, 63, 1),
        accentColor: Colors.white,
        canvasColor: Color.fromRGBO(83, 186, 209, .3),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              title: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
      ),
      home: TabsScreen(),
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(),
        CategoryItemsScreen.routeName: (context) => CategoryItemsScreen(),
        RecipieDetailsScreen.routeName: (context) => RecipieDetailsScreen(),
        FiltersSettingsScreen.routeName: (context) => FiltersSettingsScreen(),
      },
    );
  }
}
