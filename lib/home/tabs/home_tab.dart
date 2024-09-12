
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';
import 'package:movies_app/home/tabs/Home_details_screen.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<Movie>> popularApiURL;
  late Future<List<Movie>> upcomingApiURL;
  late Future<List<Movie>> top_ratedApiURL;

  @override
  void initState() {
    popularApiURL = APIManager().getSources();
    upcomingApiURL = APIManager().upcomingSources();
    top_ratedApiURL = APIManager().topratedSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
      FutureBuilder(
        future: popularApiURL,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final movies = snapshot.data!;

          return CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, movieIndex) {
              final movie = movies[index];
              return
                Expanded(
                child: InkWell(
                  onTap: () {
                    variable.MovieId=movie.id;
                    Navigator.of(context).pushNamed(
                        HomeDetailsScreen.routeName);
                  },
                  child: Container(
                    width: 1000,
                    height: 289,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}",),
                          alignment: Alignment.topCenter,
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Image.network(
                          "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                          alignment: Alignment.bottomLeft,
                          width: 129,
                          height: 199,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Image.asset(
                              "assets/images/play-button-2.png",
                              alignment: Alignment.center,
                              width: 129,
                              height: 199,
                            ),
                            Text(
                              movie.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              movie.date,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(height: 8,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 289,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1.4,
              autoPlayInterval: const Duration(seconds: 10),
            ),
          );
        },
      ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: height * 0.26,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Releases',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: FutureBuilder(
                      future: upcomingApiURL,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final movies2 = snapshot.data!;
                        return CarouselSlider.builder(
                          itemCount: movies2.length,
                          itemBuilder: (context, index, movieIndex) {
                            final movie1 = movies2[index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie1.posterPath}",
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
                              ],
                            );
                          },
                          options: CarouselOptions(
                            height: 127,
                            viewportFraction: 0.27,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            aspectRatio: 1.4,
                          ),
                        );},),),],
            ),
          ),
        ),
        SizedBox(
          height: 10,
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
                  'Recomended',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: FutureBuilder(
                    future: top_ratedApiURL,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final movies3 = snapshot.data!;
                      return CarouselSlider.builder(
                        itemCount: movies3.length,
                        itemBuilder: (context, index, movieIndex) {
                          final movie3 = movies3[index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/original/${movie3.posterPath}",
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
                               movie3.title,
                                style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.start,
                              ),
                              Text(
                                movie3.date,
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

    ]
    );
  }
}

