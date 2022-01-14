import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'appLocal.dart';

class Slide extends StatefulWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  static const _colorizeTextStyle = TextStyle(
    fontSize: 30.0,
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
    return DefaultTabController(length: 3,
        child:Scaffold(
          body: TabBarView(
            children : [
            Container(color: Color(0xff001D3D),
              height: double.infinity,
              width: double.infinity,
              child:  Center(
                child: AnimatedTextKit(
                  animatedTexts: [ColorizeAnimatedText('${getLang(context, "Welcome")}', textStyle: _colorizeTextStyle, colors: _colorizeColors)],),
              ),),
              Container(color: Color(0xff001D3D),
                height: double.infinity,
                width: double.infinity,
                child:  Center(
                  child: AnimatedTextKit(
                    animatedTexts: [ColorizeAnimatedText('${getLang(context, "Ready")}', textStyle: _colorizeTextStyle, colors: _colorizeColors)],),
                ),),
              Container(color: Color(0xff001D3D),
                height: double.infinity,
                width: double.infinity,
                child:  Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("login");
                    }, child: AnimatedTextKit(
                      animatedTexts: [ColorizeAnimatedText('${getLang(context, "Login")}', textStyle: _colorizeTextStyle, colors: _colorizeColors)],),
                    style:ElevatedButton.styleFrom(
                    primary: Color(0xff001D3D),
                    ),),
                    Divider(),
                    Text("${getLang(context, "or")}",style: TextStyle(color: Colors.white,fontSize: 16),),
                      Divider(),
                      ElevatedButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("signup");
                    }, child: AnimatedTextKit(
                      animatedTexts: [ColorizeAnimatedText('${getLang(context, "Signup")}', textStyle: _colorizeTextStyle, colors: _colorizeColors)],),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff001D3D)
                      ),
                      ),
                  ],)
                ),),
            ]
          ),));
  }
}
