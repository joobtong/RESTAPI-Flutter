import 'package:flutter/material.dart';
import 'package:flutter1_app/model/movies.dart';
import 'package:flutter1_app/service/MovieService.dart';
import 'package:flutter/services.dart';
import 'package:flutter1_app/swiper.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.deepOrangeAccent,
//      systemNavigationBarIconBrightness: Brightness.dark
//
//    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      // MyHomePage(title: 'REST API'),
    );
  }
}





class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future:  MovieService.fetchMovie(),
        builder: (context,snap){
          if(snap.hasData){
            List<Movies> list = snap.data;
            return  CustomScrollView(
              slivers: <Widget>[
                _buildMovieList(list)
              ],
            );
          }else{
            return CircularProgressIndicator();
          }
        },
      )

    );
  }

  SliverGrid _buildMovieList(List<Movies> movies){

    return SliverGrid(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
            childAspectRatio: 0.60
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context,int index){
        return Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 260,
                  width: double.infinity,
                child: Image.network(movies[index].background,fit: BoxFit.fill,),
              ),
              SizedBox(height: 10),
              Text(movies[index].release_date,style: TextStyle(fontSize: 11,fontFamily: 'kanit',fontWeight: FontWeight.bold,color: Colors.yellow),),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Text(movies[index].name,style: TextStyle(fontSize: 12,fontFamily: 'kanit',fontWeight: FontWeight.bold,color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70,left: 70),
                child: Divider(
                  color: Colors.yellow[600],
                ),
              )
            ],
          ),
        );
      },
      childCount: movies.length
      ),
    );
  }


}
