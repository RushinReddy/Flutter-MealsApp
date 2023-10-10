import 'dart:ui';

import 'package:flutter/material.dart';

import '../screens/filterSettings_screen.dart';
//import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
// Function onTapped;
// String title;
// IconData icon;

//   MainDrawer({this.icon, this.onTapped, this.title});

  Widget listTile({Function onTapped, String title, IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(91, 64, 122, 0.6), Colors.teal[800]]),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Rushin's \n Recipies",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            listTile(
                icon: Icons.category,
                onTapped: () {
                  //Navigator.of(context).pushNamed(TabsScreen.routeName);
                  //use the below instead of the above in order to go back to same page
                  Navigator.pop(context);
                },
                title: "Categories"),
            listTile(
                icon: Icons.settings,
                onTapped: () {
                  Navigator.of(context)
                      .pushNamed(FiltersSettingsScreen.routeName);
                },
                title: "Filters"),
          ],
        ),
      ),
    );
  }
}
