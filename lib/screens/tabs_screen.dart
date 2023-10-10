import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
} //dont touch above this

class _TabsScreenState extends State<TabsScreen> {
  //list of tabs' data
  List<Map<String, dynamic>> _tabs = [
    {
      'title': 'Categories',
      'screenWidget': CategoriesScreen(),
    },
    {
      'title': 'Favourites',
      'screenWidget': FavouritesScreen(),
    }
  ];

//index for sekected tab
  int selectedTabIndex = 0;

// onTapped function
  void _selectedTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[selectedTabIndex]['screenWidget'],
      appBar: AppBar(
        title: Text(_tabs[selectedTabIndex]['title']),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: 30,
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 30,
            ),
            title: Text('Favoutites'),
          )
        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).accentColor.withOpacity(0.5),
        currentIndex: selectedTabIndex,
        selectedFontSize: 14,
        //type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
