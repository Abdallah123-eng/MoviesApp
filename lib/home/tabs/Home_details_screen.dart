import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';

class HomeDetailsScreen extends StatefulWidget {
  static const String routeName = 'HomeDetailsScreen';

  const HomeDetailsScreen({super.key});

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  late Future<List<Movie>> SimilarApiURL;
  late Future<List<Movie>> DetailsApiURL;
  @override
  void initState() {
    SimilarApiURL = APIManager().SimilarSources();
    DetailsApiURL = APIManager().DetailsSources();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${variable.MovieId}"),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


          FutureBuilder(
          future: DetailsApiURL,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final movies9 = snapshot.data!;
            return Column(
                  children: [
              Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/original/${movies9[0].backDropPath}",
                  width: double.infinity,
                  height: height * 0.22,
                  fit: BoxFit.fill,
                ),
              ],
            ),
                      ],
                );
              },),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text("ie/${variable.MovieId}/si")',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '2019  PG-13  2h 7m',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/photo1.png',
                              height: height * 0.25,
                              width: width * 0.3,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Image.asset(
                            'assets/images/bookmark.png',
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topLeft,
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            iconSize: 20,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: Text('Action'),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: width * 0.6,
                            child: Text(
                              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                              style: TextStyle(fontSize: 12.5),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text('7.7')
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 246,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More Like This',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: FutureBuilder(
                        future: SimilarApiURL,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final movies4 = snapshot.data!;
                          return CarouselSlider.builder(
                            itemCount: movies4.length,
                            itemBuilder: (context, index, movieIndex) {
                              final movie4 = movies4[index];
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/original/${movie4.posterPath}",
                                          height: 127,
                                          width: 96,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/bookmark.png',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      Text(
                                        '7.7',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    movie4.title,
                                    style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    movie4.date,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),textAlign: TextAlign.start,
                                  )


                                ],

                              );
                            },
                            options: CarouselOptions(
                              height: 186,
                              viewportFraction: 0.27,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              aspectRatio: 1.4,
                            ),
                          );},),),],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
