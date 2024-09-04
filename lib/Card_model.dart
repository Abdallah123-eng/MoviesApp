

import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  String image;
   CardModel({required this.image,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child:Image.asset(image),

      ),
    );
  }
}
