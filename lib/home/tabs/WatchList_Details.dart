import 'package:flutter/material.dart';

class WatchListWidget extends StatelessWidget {
  String image;
  String title;
  String data;
  String name1;
  String name2;

  WatchListWidget({
    super.key,
    required this.image,
    required this.title,
    required this.data,
    required this.name1,
    required this.name2,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500/${image}",
            fit: BoxFit.fill,
            height: 90,
            width: 140,
          ),
          Image.asset(
            'assets/images/bookmark.png',
          ),
        ],
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data),
          Row(
            children: [
              Text('$name1,$name2'),
            ],
          ),
        ],
      ),
    );
  }
}
