import 'package:flutter/material.dart';
import 'package:movies_app/home/home.dart';
import 'package:movies_app/home/tabs/Browse_Details_Screen.dart';
import 'package:movies_app/home/tabs/Home_details_screen.dart';
import 'package:movies_app/home/tabs/search_tab.dart';
import 'package:movies_app/providers/MyProviders.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProvider()),
      // ChangeNotifierProvider(create: (context)=> SuraDetailsProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
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
