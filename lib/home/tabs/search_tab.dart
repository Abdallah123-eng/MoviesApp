import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';
import 'package:movies_app/providers/MyProviders.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Future<List<search>> SearchApiURL;
  final TextEditingController MovieName = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    MovieName.dispose();
    super.dispose();
  }

  void initState() {
    SearchApiURL = APIManager().SearchSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
                 InkWell(
                   onTap: ()
                     {
                       setState(() {});
                       initState();
                     },
                    child: Icon(Icons.search)),

              Expanded(
                child: TextField(
                  onChanged: (value) {
                    variable.searchname = MovieName.text;
                  },
                  controller: MovieName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black87,
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Enter Your Name Here',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
        ),
      Container(
        child:  MovieName.text.isNotEmpty?FutureBuilder(
          future: SearchApiURL,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final movies2 = snapshot.data!;
            return Expanded(
              child: CarouselSlider.builder(
                itemCount: movies2.length,
                itemBuilder: (context, index, movieIndex) {
                  final movie8 = movies2[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      child: Image.asset("assets/images/Mask Group 2.png",height: 89,width: 140,)
                                    /*Image.network(
                                              "https://image.tmdb.org/t/p/w500/${movie2.backDropPath}",
                                              fit: BoxFit.fill,
                                              height: 200,
                                            ),*/
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie8.title,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movie8.date,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movie8.originaltitle,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  viewportFraction: 0.18,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 1.4,
                ),
              ),
            );
          },
        ):Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.movie_creation_outlined,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                'No movies found',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
        ),
      ),

      ],
    );
  }
}
