
import 'package:flutter/material.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/home/tabs/browse_tab.dart';
import 'package:movies_app/home/tabs/home_tab.dart';
import 'package:movies_app/home/tabs/search_tab.dart';
import 'package:movies_app/home/tabs/watch_list_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(

            unselectedItemColor: Colors.white,
            selectedItemColor: Appcolor.primary,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: selectedindex,
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                // backgroundColor: Color(0xffB7935F),
                  backgroundColor: Colors.black,
                  icon: ImageIcon(AssetImage("assets/images/Home icon.png")),
                  label: "Home"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                //backgroundColor: Color(0xffB7935F),
                  icon: Icon(Icons.search),
                  label: "Search"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                // backgroundColor: Color(0xffB7935F),
                  icon: ImageIcon(AssetImage("assets/images/Icon material-movie.png")),
                  label: "Browse"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                // backgroundColor: Color(0xffB7935F),
                  icon: ImageIcon(AssetImage("assets/images/Iconbookmarks.png")),
                  label: "WatchList"),

            ],
          ),
          body: tabs[selectedindex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
   HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab()
  ];
}
