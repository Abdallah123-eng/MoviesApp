import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Card_model.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
   var Results;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: APIManager.getSources(),
        builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator());
          }
        if(snapshot.hasError)
          {
            return Text("some thing wrong");
          }

        Results = snapshot.data?.title??[] ;
        
        return ListView.builder(itemBuilder: (context,index){
          return Text(Results[index].title??"");
        },itemCount: Results.length,);

        },);

      /*Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Releases ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CardModel(image: "assets/images/photo1.png",),
                            CardModel(image: "assets/images/photo2.png",),
                            CardModel(image: "assets/images/Annabelle.png",),
                            CardModel(image: "assets/images/photo3.png",),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
    );*/
  }
}
