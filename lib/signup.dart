import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:http/http.dart' as http;
import 'package:project/appLocal.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  static const _colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

// Colorize Colors
  static const _colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  List sign = [{
    "username" : "",
    "email" : "",
    "phone" : "" ,
    "password" : "",
  }
  ];
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  bool hidepassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff001D3D)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text("Signup",style: TextStyle(color: Color(0xffF1FAEE),fontSize: 35,fontWeight: FontWeight.bold),),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  '${getLang(context, "Signup")}',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors,
                ),
              ],
            ),
            Divider(),

            Form(child: Column(children: [
              Container(margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: username,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "UserName")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D)))
                  ),
                ),),
              Divider(),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Email")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone,color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Phone")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D)))
                  ),
                ),
              ),

              Divider(),

              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if(text!.length < 8)
                    {return "The password cannot be less than 8 digits";}
                    return null;
                  },
                  obscureText: hidepassword,
                  controller: pass,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password,color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Password")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          hidepassword=!hidepassword;
                        });
                      },icon: Icon(hidepassword?Icons.visibility_off_outlined:Icons.visibility),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Color(0xff457B9D)))
                  ),
                ),
              ),

              Divider(),

              ElevatedButton(onPressed: (){
                sign.add(username.text);
                sign.add(email.text);
                sign.add(pass.text);
                sign.add(phone.text);
                print(sign);
                Navigator.of(context).pushReplacementNamed("login");
              },
                child: Text("${getLang(context, "Signup")}",style: TextStyle(color: Color(0xffF1FAEE)),),
                style: ElevatedButton.styleFrom(primary: Color(0xffFFC300),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
              SizedBox(width: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${getLang(context, "AHAA")}",style: TextStyle(color:Color(0xffF1FAEE)),),
                  TextButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed("login");
                  }, child: Text("${getLang(context, "Login")}",style: TextStyle(color: Color(0xffFFC300)),)),
                ],)
            ],))
          ],
        ),
      ),
    );
  }
}
/* void registerApi(){
   var headers = {
   'Accept' : 'application/json'
   };
   var request = http.Request('POST',Uri.parse("http://192.168.45.166:8000/api/Register"));
  request.bodyFields={
    'name' : username.text,
    'email' : email.text,
    'phone' : phone.text,
    'password' : pass.text,
  };
  request.headers.addAll(headers);
  request.send().then((value){
    print('Response status :${value.statusCode}');
    value.stream.bytesToString().then((value) {
      var res = jsonDecode(value);

    });
  });
  }*/