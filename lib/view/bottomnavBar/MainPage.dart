import 'package:flutter/material.dart';
import 'package:newsapp_project/controller/bottomnavController.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 210, 29, 29)),
          child: BottomNavigationBar(
              currentIndex:
                  Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context, listen: false)
                  .onItemTap,
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 210, 29, 29),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 25,
              ),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded),
                    label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_sharp),
                    label: "Search"),
              ]),
        ),
      ),
    );
  }
}