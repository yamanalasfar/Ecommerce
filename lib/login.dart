import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'package:project/appLocal.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {


  final TextEditingController email = new TextEditingController();
  final TextEditingController pass = new TextEditingController();
  List sign = [{
    "email" : "yaman@gmail.com",
    "password" : "123456789"
  },{
    "email" : "waleed@gmail.com",
    "password" : "123456789"
  },{
    "email" : "mo@gmail.com",
    "password" : "123456789"
  },{
    "email" : "abd@gmail.com",
    "password" : "987654321"
  }];
  bool hidepassword = true;
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
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  '${getLang(context, "Login")}',
                  textStyle: _colorizeTextStyle,
                  colors: _colorizeColors,
                ),
              ],
            ),
            Divider(),

            Form(child: Column(children: [
              Container(margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Email")}",
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
                for(int i=0;i<sign.length;i++) {
                  if (email.text == sign[i]["email"] &&
                      pass.text == sign[i]["password"])
                  {
                    Navigator.of(context).pushReplacementNamed("homepage");
                    return ;
                  }
                }
                showModalBottomSheet(context: context, builder: (context){
                  return Container(
                    height: 100,
                    child: Text("${getLang(context, "eopanc")}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  );
                });
              },
                child: Text("${getLang(context, "Login")}",style: TextStyle(color: Color(0xffF1FAEE)),),
                style: ElevatedButton.styleFrom(primary: Color(0xffFFC300),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
              SizedBox(width: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${getLang(context, "DHAA")}",style: TextStyle(color:Color(0xffF1FAEE)),),
                  TextButton(onPressed: (){
                    Navigator.of(context).pushNamed("signup");
                  }, child: Text("${getLang(context, "Signup")}",style: TextStyle(color: Color(0xffFFC300)),)),
                ],)
            ],))
          ],
        ),
      ),
    );
  }
}
