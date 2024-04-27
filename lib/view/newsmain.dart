import 'package:flutter/material.dart';
import 'package:newsapp_project/controller/bottomnavController.dart';
import 'package:newsapp_project/controller/categoryController.dart';
import 'package:newsapp_project/controller/homescreenController.dart';
import 'package:newsapp_project/controller/searchscreenController.dart';
import 'package:newsapp_project/controller/splashScreenController.dart';
import 'package:newsapp_project/view/bottomnavBar/MainPage.dart';
import 'package:newsapp_project/view/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, _) {
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : MainPage(); 
            },
          ),
        ));
  }
}