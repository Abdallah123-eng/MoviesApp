import 'package:flutter/material.dart';
import 'package:movies_app/home/home.dart';
import 'package:movies_app/home/tabs/Browse_Details_Screen.dart';
import 'package:movies_app/home/tabs/Home_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HomeDetailsScreen.routeName: (context) => HomeDetailsScreen(),
        BrowseDetailsScreen.routeName: (context) => BrowseDetailsScreen(),
      },
    );
  }
}
