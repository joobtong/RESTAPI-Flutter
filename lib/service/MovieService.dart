import 'dart:convert';
import 'package:flutter1_app/model/movies.dart';
import 'package:flutter1_app/model/Result.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MovieService{

  static  Future<List<Movies>> fetchMovie()  async{
    List<Movies> list = new List<Movies>();
    var url = "https://ex2h4bot1l.execute-api.ap-southeast-1.amazonaws.com/v1/movie/list";
    var jsonRes = await http.get(url,headers: {"x-api-key":"00c1m98MZy8H0LYGsbJbY92qH2NdOzGW2GwXoqrg"});
    String source = Utf8Decoder().convert(jsonRes.bodyBytes);
    Map map = json.decode(source);
    Result result = Result.fromJson(map["result"]);
    for (int i =0;i<result.movies.length;i++){

      Movies movie = Movies.fromJson(result.movies[i]);

      initializeDateFormatting("th", null).then((_) {
        String x = movie.release_date;
        final f = new DateFormat('dd MMMM yyyy','th');
        String dateMovie = x.substring(0,10);
        DateTime date = DateTime.parse(dateMovie);
        String formatted = f .format(date);
        movie.release_date = formatted;
      });
      list.add(movie);

    }

    return list;

  }


}