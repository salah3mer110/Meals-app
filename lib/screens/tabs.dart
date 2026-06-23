import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen();
    String selectedScreenTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(meals: []);
      selectedScreenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(selectedScreenTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),

            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
