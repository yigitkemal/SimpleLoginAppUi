import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  String userName= 'emptyness', password;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    readInfo();
  }

  Future<void> readInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userName = sharedPreferences.getString('mail');
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
            userName,style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
