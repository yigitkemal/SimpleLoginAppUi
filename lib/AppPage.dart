import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  String userName, password;

  Future<void> readInfo() async {
    var sharedPreferences = SharedPreferences.getInstance();

    setState(() {
      //userName =
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: Container(
          color: Colors.white,
          width: 100,
          height: 100,
          child: Text(
            userName
          ),
        ),
      ),
    );
  }
}
