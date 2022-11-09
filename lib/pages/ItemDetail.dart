import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:experience_flutter/Animation/FadeAnimation.dart';

class ItemDetail extends StatefulWidget {
  final String image;

  const ItemDetail({Key key, this.image}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

// 返回按钮
Widget _btnReturn(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
  );
}

// 确认按钮
Widget _btnGetThisOne() {
  return FadeAnimation(
    1.5,
    Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Center(
          child: Text(
            "就TA了",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

// 收藏
Widget _like() {
  return Container(
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
  );
}

Widget _sizeItem(delay, sizeNum) {
  return FadeAnimation(
      delay,
      Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          sizeNum,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ));
}

List sizeArray = [
  {"delay": 1.23, "sizeNum": '40'},
  {"delay": 1.23, "sizeNum": '41'},
  {"delay": 1.23, "sizeNum": '42'},
  {"delay": 1.23, "sizeNum": '43'},
  {"delay": 1.23, "sizeNum": '44'},
];

List background_images = [
  'assets/images/one.jpg',
  'assets/images/two.jpg',
  'assets/images/three.jpg',
];

Widget _imgSwipe(imageList) {}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: 'red',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[_btnReturn(context), _like()],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeAnimation(
                              1.3,
                              Text(
                                "Sneakers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          FadeAnimation(
                              1.4,
                              Text(
                                "Size",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              for (final item in sizeArray)
                                _sizeItem(item['delay'], item['sizeNum'])
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          _btnGetThisOne(),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
