import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List pro = [{
    "username":"Yaman alasfar",
    "facebook":"yaman alasfar",
    "phone":"0931666734",
    "Email":"yaman@gmail.com",
  }];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff001D3D), width: 10),
        ),
        padding: EdgeInsets.only(top: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff001D3D),
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(flex: 1,child: Icon(Icons.face)),
                    Expanded(flex: 2,child: Text("${pro[0]["username"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(flex: 1,child: Icon(Icons.facebook)),
                    Expanded(flex: 2,child: Text("${pro[0]["facebook"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(flex: 1,child: Icon(Icons.call)),
                    Expanded(flex: 2,child: Text("${pro[0]["phone"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(flex: 1,child: Icon(Icons.mail_outline)),
                    Expanded(flex: 2,child: Text("${pro[0]["Email"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ],
            ))
          ],),
      ),),
    ));
  }
}
