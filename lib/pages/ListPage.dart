import 'dart:async';

import 'package:experience_flutter/Animation/FadeAnimation.dart';
import 'package:experience_flutter/pages/ItemDetail.dart';
import 'package:flutter/material.dart';

var dataList = [
  {
    "delay": 1.5,
    "colorTag": 'red',
    "backgroundUrl": 'assets/images/one.jpg',
    "title": '11111',
    "desc": '0010',
    "price": '12300',
  },
  {
    "delay": 1.5,
    "colorTag": 'blue',
    "backgroundUrl": 'assets/images/two.jpg',
    "title": '22222',
    "desc": '0020',
    "price": '12311',
  },
  {
    "delay": 1.5,
    "colorTag": 'white',
    "backgroundUrl": 'assets/images/three.jpg',
    "title": '33333',
    "desc": '0300',
    "price": '12322',
  },
  {
    "delay": 1.5,
    "colorTag": 'white1',
    "backgroundUrl": 'assets/images/three.jpg',
    "title": '33333',
    "desc": '0301',
    "price": '12322',
  },
];

Widget _heart() {
  return new FadeAnimation(
      1.2,
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 20,
            color: Colors.red,
          ),
        ),
      ));
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          "体验精选",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        brightness: Brightness.light,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "全部",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sneakers",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  for (var item in dataList)
                    FadeAnimation(
                        item['delay'],
                        makeItem(
                            image: item['backgroundUrl'],
                            title: item['title'],
                            tag: item['colorTag'],
                            desc: item['desc'],
                            price: item['price'],
                            context: context))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, price, desc, title, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetail(
                        image: image,
                      )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        FadeAnimation(
                            1.1,
                            Text(
                              desc,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  _heart(),
                ],
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    "\$" + price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
