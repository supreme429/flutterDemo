import 'package:flutter/material.dart';
import 'package:experience_flutter/pages/LoginPage.dart';
import 'package:experience_flutter/theme/app_colors.dart';
import 'package:experience_flutter/widgets/welcome_widget.dart';

// 欢迎页面
class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          WelcomeHeaderWidget(),
          // GradientBtnWidget(
          //   width: 208,
          //   child: BtnTextWhiteWidget(
          //     text: '注册',
          //   ),
          // ),
          SizedBox(height: 16),
          GestureDetector(
            child: LoginBtnWidget(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ));
            },
          ),
          SizedBox(height: 16),
          SizedBox(height: 54),
          Row(
            children: [
              Spacer(),
              LineWidget(),
              LoginTypeIconWidget(icon: 'assets/images/logo_ins.png'),
              LoginTypeIconWidget(icon: 'assets/images/logo_fb.png'),
              LoginTypeIconWidget(icon: 'assets/images/logo_twitter.png'),
              LineWidget(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
