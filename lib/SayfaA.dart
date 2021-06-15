import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {
  @override
  _SayfaAState createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  String name = "";
  int yas = 0;
  bool bekarMi = false;

  Future<void> dataRead() async{
    var sp = await SharedPreferences.getInstance();
    name = sp.getString("name") ?? "isimsiz"  ;
    yas = sp.getInt("yas") ?? 00;
    bekarMi = sp.getBool("bekarMi") ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sayfa A"
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(name),
              Text(yas.toString()),
              Text(bekarMi.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
