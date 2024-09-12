import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';

class BrowseDetailsScreen extends StatefulWidget {
  static const String routeName = 'BrowseDetailsScreen';

  const BrowseDetailsScreen({super.key});

  @override
  State<BrowseDetailsScreen> createState() => _BrowseDetailsScreenState();
}

class _BrowseDetailsScreenState extends State<BrowseDetailsScreen> {
  late Future<List<Movie>> dicoverApiURL;

  @override
  void initState() {
    dicoverApiURL = APIManager().DiscoverSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(variable.Browsename),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: dicoverApiURL,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final movies8 = snapshot.data!;

                return  Expanded(
                  child: CarouselSlider.builder(
                          itemCount: movies8.length,
                          itemBuilder: (context, index, movieIndex) {
                        final movie8 = movies8[index];
                        return Expanded(
                          child: Column(
                            children: [
                                  Container(
                                    color:Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.network(
                                              "https://image.tmdb.org/t/p/original/${movie8.backDropPath}",
                                              fit: BoxFit.fill,
                                              height: 200,
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Text(movie8.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                          SizedBox(height: 8,),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                Text(movie8.overview),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Text(movie8.date,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.end,)

                                        ],
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                      viewportFraction: 0.5,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      aspectRatio: 1.4,
                      ),
                  ),
                );
              },
            ),
      ])
    );
  }
}
