
import 'package:flutter/material.dart';
import 'package:newsapp_project/view/categoryScreen/categoryScreen.dart';
import 'package:newsapp_project/view/homeScreen/homeScreen.dart';
import 'package:newsapp_project/view/searchScreen/searchScreen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 1;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CAtegoryScreen(),
    SearchScreen()
  ];

}