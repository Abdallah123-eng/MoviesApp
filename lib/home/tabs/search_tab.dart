import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/SourceResponse.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String MovieName="";
  late Future<List<Movie>> SearchApiURL;
  @override
  void initState() {
    SearchApiURL = APIManager().SearchSources();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               TextField(
                 onChanged: (value){
                    MovieName=value;
                 },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),

              Icon(
                Icons.movie_creation_outlined,
                size: 100,
                color: Colors.grey,
              ),
              Text(
                'No movies found',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              FutureBuilder(
                future: SearchApiURL,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final movies = snapshot.data!;

                  return CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index, movieIndex) {
                      final movie = movies[index];
                      return Column(
                        children: [

                          if(MovieName==movie.title )
                              Text("kjhjkml")
                          else
                            Text("wrong")



                        ],
                      );

                        /* Container(
                            width: 1000,
                            height: 289,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
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
                                  ],
                                )
                              ],
                            ),
                          ),*/


                    },
                    options: CarouselOptions(
                      height: 289,
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.4,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                  );
                },
              )










            ],
        ));


      FutureBuilder(
      future: SearchApiURL,
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
                child: Container(
                    width: 1000,
                    height: 289,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
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
                          ],
                        )
                      ],
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
            autoPlayInterval: const Duration(seconds: 3),
          ),
        );
      },
    );
  }
}
