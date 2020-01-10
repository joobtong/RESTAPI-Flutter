import 'package:flutter1_app/model/movies.dart';

class Result {
  List movies;
  Result({this.movies});
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      movies: json["movies"] ,
    );
  }
}