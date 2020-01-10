
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  SwiperController controller;
  List<bool> autoplayes;
  List<SwiperController> controllers;
  List<String> _name = ["1","2","3","4"];
  @override
  void initState() {
    controller = new SwiperController();
    autoplayes = new List()
      ..length = 10
      ..fillRange(0, 10, false);
    controllers = new List()
      ..length = 10
      ..fillRange(0, 10, new SwiperController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Swiper(
        loop: false,
        itemCount: 10,
        controller: controller,
        pagination: new SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new SizedBox(
                child: new Swiper(
                  controller: controllers[index],
                  pagination: new SwiperPagination(

                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      color: Colors.greenAccent,
                      child: new Text(_name[index]),
                    );
                  },
                  autoplay: autoplayes[index],
                ),
                height: 300.0,
              ),
              new RaisedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = true;
                  });
                },
                child: new Text("Start autoplay"),
              ),
              new RaisedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = false;
                  });
                },
                child: new Text("End autoplay"),
              ),
              new Text("is autoplay: ${autoplayes[index]}")
            ],
          );
        },
      ),
    );
  }
}
