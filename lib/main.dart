import 'package:flutter/material.dart';
import 'package:flutter_shared_pref_ex/SayfaA.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
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
            primarySwatch: Colors.purple,
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
  Future<void> dataLog() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("name", "ahmet");
    sp.setInt("yas", 18);
    sp.setBool("bekarMi", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blueGrey.withOpacity(0.5),Colors.purple.withOpacity(0.5)],
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: 700,
                    minWidth: 500,
                  ),
                  margin: EdgeInsets.all(100),
                  width: (MediaQuery.of(context).size.width / 5)*2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: Text("Log in",style: TextStyle(fontSize: 15.sp,color: Colors.black,),textAlign: TextAlign.left,),
                      ),
                      Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          child: TextField()),
                      Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          child: TextField()),
                      Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          child: TextField()),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.yellow,
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: ElevatedButton(
                                  child: Container(
                                    color: Colors.green,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesome5.google,size: 2.w,),
                                        SizedBox(width: 10,),
                                        Text("Google ile Giriş Yap",style: TextStyle(fontSize: 4.sp),)
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.pink,
                                    alignment: Alignment.center,
                                  ),
                                  onPressed: (){},
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesome5.apple,size: 2.w,),
                                        SizedBox(width: 10,),
                                        Text("Apple ile Giriş Yap",style: TextStyle(fontSize: 4.sp,),)
                                      ],
                                    ),
                                  ),
                                  onPressed: (){},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            dataLog();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SayfaA()));
                          },
                          child: Text("İkinci Sayfa"))
                    ],
                  ),
                ),
               /* Container(
                  child: Image.asset("images/note.png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width/3,),
                ),*/
              ],
            ),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
