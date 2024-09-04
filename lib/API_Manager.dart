
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/SourceResponse.dart';

class APIManager{
//https://api.themoviedb.org/3/movie/popular
//https://api.themoviedb.org/3/movie/popular?language=en-US&page=1


  static Future<Results> getSources()async{
   Uri url=Uri.https("api.themoviedb.org","/3/movie/popular",{"language":"en-US"});
   http.Response responce= await http.get(url);

   var json=jsonDecode(responce.body);

   Results sourceResponse=Results.fromJson(json);
   return sourceResponse;

 }

}
