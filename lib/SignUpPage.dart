import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared_pref_ex/CustomTextfield.dart';
import 'package:flutter_shared_pref_ex/SignInPage.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String mail,password,nickName;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initalizePreference().whenComplete((){
      setState(() {});
    });
  }

  Future<void> initalizePreference() async{
    this.sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserInformation(BuildContext context) async{
    _formKey.currentState.save();
    sharedPreferences.setString('nickName', nickName);
    sharedPreferences.setString('mail', mail);
    sharedPreferences.setString('password', password);

    print("------------------------------------------------" + nickName + ' ' + mail + ' ' + password );
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
                    padding: EdgeInsets.symmetric(horizontal: 100),
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
                          child: Text("Sign Up",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("This is an example of a signup page written in Flutter.",style: TextStyle(fontSize: 5.sp,fontWeight: FontWeight.w200,color: Colors.grey,),textAlign: TextAlign.left,),
                        ),
                        SizedBox(height: 50,),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: CustomTextField(
                                    baslik: "Nickname",
                                    isLighter: true,
                                    onSaved: (input) => nickName = input,
                                  )),
                              Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: CustomTextField(
                                    baslik: "E-Mail",
                                    isLighter: true,
                                    onSaved: (input) => mail = input,
                                  )),
                              Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: CustomTextField(
                                    baslik: "Password",
                                    isLighter: true,
                                    obsecure: true,
                                    onSaved: (input) => password = input,
                                  )),
                              Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10),
                                  child: CustomTextField(
                                    baslik: "Password Again",
                                    isLighter: true,
                                    obsecure: true,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected){},
                              size: 20,
                              uncheckedColor: Colors.white,
                              checkedColor: Colors.deepPurple.shade900,
                              borderColor: Colors.grey,
                            ),
                            SizedBox(width: 5,),
                            Text("By creating an account, I agree to the privacy policy.",style: TextStyle(color: Colors.grey,fontSize: 4.sp),)
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            child: Container(
                              //color: Colors.green,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Sign Up", style: TextStyle(
                                      fontSize: 6.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade900,
                              side: BorderSide(
                                width: 2, color: Colors.purple.shade900,),
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  width: 2, color: Colors.purple.shade900,),
                              ),
                            ),
                            onPressed: () {
                              saveUserInformation(context);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Divider(color: Colors.grey,height: 2,)),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Center(child: Text("OR",style: TextStyle(fontSize: 5.sp,color: Colors.grey),)),
                              ),
                              Expanded(child: Divider(color: Colors.grey,height: 2,))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  //color: Colors.yellow,
                                  height: 60,
                                  child: ElevatedButton(
                                    child: Container(
                                      //color: Colors.green,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesome5.google,size: 2.w,color: Colors.purple.shade900,),
                                          SizedBox(width: 10,),
                                          Text("Sign Up With Google",style: TextStyle(fontSize: 4.sp,color: Colors.purple.shade900),)
                                        ],
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      //primary: Colors.pink,
                                      primary: Colors.white,
                                      side: BorderSide(width: 2,color: Colors.purple.shade900,),
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(width: 2,color: Colors.purple.shade900,),
                                      ),
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  height: 60,
                                  child: ElevatedButton(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesome5.apple,size: 2.w,color: Colors.purple.shade900,),
                                          SizedBox(width: 10,),
                                          Text("Sign Up With Apple",style: TextStyle(fontSize: 4.sp,color: Colors.purple.shade900),)
                                        ],
                                      ),
                                    ),
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      //primary: Colors.pink,
                                      primary: Colors.white,
                                      side: BorderSide(width: 2,color: Colors.purple.shade900,),
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(width: 2,color: Colors.purple.shade900,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Already have an acoount? ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: 'Sign In!',
                                    style: TextStyle(color: Colors.purple.shade900),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                                      },
                                  ),
                                ]
                            ),
                          ),
                        ),
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
