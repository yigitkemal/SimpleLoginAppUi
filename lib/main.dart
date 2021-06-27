import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared_pref_ex/CustomTextfield.dart';
import 'package:flutter_shared_pref_ex/SignInPage.dart';
import 'package:flutter_shared_pref_ex/SignUpPage.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: MyHomePage(title: 'Web ile devam ediyorum'),
        );
      }
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

  bool checkedValue = false;

  Future<void> dataLog() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("name", "John");
    sp.setInt("yas", 18);
    sp.setBool("bekarMi", true);
  }

  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }


}

