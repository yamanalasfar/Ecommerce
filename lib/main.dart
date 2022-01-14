import 'package:flutter/material.dart';
import 'package:project/Slider.dart';
import 'package:project/appLocal.dart';
import 'package:project/comment.dart';
import 'package:project/login.dart';
import 'package:project/Slider.dart';
import 'package:project/profile.dart';
import 'package:project/signup.dart';
import 'add.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
      routes: {
        "login" : (context) => Login(),
        "signup" : (context) => Signup(),
        "homepage" : (context) => HomePage(),
        "add" : (context) => Add(),
        "profile" : (context) => Profile(),
        "comment": (context) => TestMe()
      },
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en" , ""),
        Locale("ar" , ""),
      ],
      localeResolutionCallback: (currentlang , supportlang){
        if(currentlang!=null){
          for(Locale local in supportlang){
            if(local.languageCode == currentlang.languageCode){
              return currentlang;
            }
          }
        }
        return supportlang.first;
      },
    );
  }
}
