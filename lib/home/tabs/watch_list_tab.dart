import 'package:movies_app/Colors_App.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/tabs/WatchList_Details.dart';


class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Watchlist',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context,  index) {
                  return const Divider(
                    color: Colors.white,
                    thickness: 2,
                    height: 30,
                    endIndent: 20,
                    indent: 20,
                  );
                },
                itemBuilder: (context, index) {
                  return WatchListWidget(
                      image: watchlist.image[index],
                      title: watchlist.title[index],
                      data: watchlist.date[index],
                      name1: 'Rosa Salazar',
                      name2: 'Christoph Waltz');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
