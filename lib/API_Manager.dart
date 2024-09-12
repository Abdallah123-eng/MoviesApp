import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';


class APIManager {

  final popularApiURL = "https://api.themoviedb.org/3/movie/popular?api_key=3a6b2daa336a793636816ea7b801d844";
  final upcomingApiURL = "https://api.themoviedb.org/3/movie/upcoming?api_key=3a6b2daa336a793636816ea7b801d844";
  final top_ratedApiURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=3a6b2daa336a793636816ea7b801d844";
  final SearchApiURL= "https://api.themoviedb.org/3/search/movie?api_key=3a6b2daa336a793636816ea7b801d844";
  final SimilarApiURL= "https://api.themoviedb.org/3/movie/917496/similar?api_key=3a6b2daa336a793636816ea7b801d844";
  final dicoverApiURL="https://api.themoviedb.org/3/discover/movie?api_key=3a6b2daa336a793636816ea7b801d844";


  Future<List<Movie>> getSources() async {
    final response = await http.get(Uri.parse(popularApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }
  Future<List<Movie>> upcomingSources() async {
    final response = await http.get(Uri.parse(upcomingApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }
  Future<List<Movie>> topratedSources() async {
    final response = await http.get(Uri.parse(top_ratedApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }
  Future<List<Movie>> SearchSources() async {
    final response = await http.get(Uri.parse(SearchApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }
  Future<List<Movie>> SimilarSources() async {
    final response = await http.get(Uri.parse(SimilarApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }
  Future<List<Movie>> DiscoverSources() async {
    final response = await http.get(Uri.parse(dicoverApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) =>
          Movie.fromMap(movie)).toList();
      return movies;
    }
    else {
      throw Exception('failed to load popular movies');
    }
  }

}


class APIManager2{
  final GenerApiURL= "https://api.themoviedb.org/3/genre/movie/list?api_key=3a6b2daa336a793636816ea7b801d844";
  Future<List<Gener>> generSources() async {
    final response = await http.get(Uri.parse(GenerApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['genres'];

      List<Gener> gener = data.map((name) =>
          Gener.fromMap(name)).toList();
      return gener;
    }
    else {
      throw Exception('failed to load gener');
    }
  }
}
