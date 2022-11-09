import 'package:flutter/material.dart';
import 'package:experience_flutter/Animation/FadeAnimation.dart';
import 'package:experience_flutter/pages/ListPage.dart';

final dataObj = new Map();
void handleLogin(context, _userName, _pwd) => {
      dataObj['userName'] = _userName,
      dataObj['pwd'] = _pwd,
      if (_userName == '' || _pwd == '')
        {print('请输入账号与密码')}
      else
        {intoListPage(context)},
      print('userName: $_userName ------ password: $_pwd'),
      print('dataObj: $dataObj')
    };

void intoListPage(context) {
  Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(opacity: animation, child: ListPage());
      }));
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String _userName = '';
  String _pwd = '';

  // 吊灯1
  Widget _light1() {
    return new Positioned(
      left: 30,
      width: 80,
      height: 200,
      child: FadeAnimation(
          1,
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/light-1.png'))),
          )),
    );
  }

  // 吊灯2
  Widget _light2() {
    return new Positioned(
      left: 140,
      width: 80,
      height: 150,
      child: FadeAnimation(
          1.3,
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/light-2.png'))),
          )),
    );
  }

  // 时钟
  Widget _clock() {
    return new Positioned(
      right: 40,
      top: 40,
      width: 80,
      height: 150,
      child: FadeAnimation(
          1.5,
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/clock.png'))),
          )),
    );
  }

  // 标题
  Widget _title() {
    return new Positioned(
      child: FadeAnimation(
          1.6,
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                "欢迎登录",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }

  // 用户名input
  Widget _userNameInput() {
    return new Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))),
      child: TextField(
        onChanged: (str) {
          _userName = str;
          setState(() {});
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "用户名",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  // 密码input
  Widget _pwdInput() {
    return new Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (str) {
          _pwd = str;
          setState(() {});
        },
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "密码",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  // 登录按钮
  Widget _loginBtn() {
    return GestureDetector(
      onTap: () {
        handleLogin(context, _userName, _pwd);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ])),
        child: Center(
          child: Text(
            "登录",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // 输入框组合
  Widget _inputForm() {
    return FadeAnimation(
        1.8,
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(143, 148, 251, .2),
                    blurRadius: 20.0,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            children: <Widget>[_userNameInput(), _pwdInput()],
          ),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      _light1(),
                      _light2(),
                      _clock(),
                      _title(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      _inputForm(),
                      SizedBox(
                        height: 60,
                      ),
                      FadeAnimation(2, _loginBtn()),
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                          1.5,
                          Text(
                            "忘记密码?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
