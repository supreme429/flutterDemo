import 'package:flutter/material.dart';
import 'package:experience_flutter/theme/app_style.dart';
import 'package:experience_flutter/widgets/login_widget.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/bg_login_header.png'),
          Column(
            children: [
              SizedBox(height: 320),
              ClipPath(
                clipper: LoginClipper(),
                child: LoginBodyWidget(),
              ),
            ],
          ),
          Positioned(
            top: 64,
            left: 28,
            child: BackIcon(),
          )
        ],
      ),
    );
  }
}

/// 登录页面内容体
class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 86),
          Text(
            '登录',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            '用户名',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 3),
          LoginInput(
            hintText: '请输入用户名',
            prefixIcon: 'assets/images/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            '密码',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 3),
          LoginInput(
            hintText: '请输入密码',
            prefixIcon: 'assets/images/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWidget(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
