import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/add.dart';
import 'package:project/appLocal.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:comment_box/comment/test.dart';
import 'package:comment_box/main.dart';
import 'package:project/main.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];
  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }
  int counter = 0;
  Views(){
    setState(() {
      counter++;
    });
  }
  TextEditingController search = new TextEditingController();
  TextEditingController edit = new TextEditingController();
  ScrollController list = new ScrollController();
  List homefound = [];
  List home = [{
    "title" : "panadol",
    "image" : "images/panadol.jpg",
    "expiration_date" : 30,
    "category" : "medicin",
    "quantity" : 3,
    "phone" : "0931666734",
    "facbook" : "yaman alasfar",
    "price" : 2500.0,
    "newPrice" : 0.0,
    "like" : true,
    "views" : 0
  },{
    "title" : "nutella",
    "image" : "images/nutealla.jpg",
    "expiration_date" : 15,
    "category" : "food",
    "quantity" : 10,
    "phone" : "0938306659",
    "facbook" : "waleed ahmad",
    "price" : 38000.0,
    "newPrice" : 0.0,
    "like" : true,
    "views" : 0
  },{
    "title" : "Lipstick",
    "image" : "images/lipstick.jpg",
    "expiration_date" : 3,
    "category" : "makeup",
    "quantity" : 12,
    "phone" : "0931666734",
    "facbook" : "yaman alasfar",
    "price" : 15670.0,
    "newPrice" : 0.0,
    "like" : true,
    "views" : 0
  },];
  Discount() {
    for(var holder in home){
      if(holder["expiration_date"]>30){holder["newPrice"]=holder["price"];}
      else{
        if(holder["expiration_date"]>15){holder["newPrice"]=holder["price"]*0.5;}
        else{holder["newPrice"]=holder["price"]*0.75;}
      }
    };
  }
  @override
  void initState() {
    homefound = home;
    Discount();
    super.initState();
  }
  var sear ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(accountName: Text("yaman"),
                accountEmail: Text("yaman@gmail.com")),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed("profile");
            }, child: Text("${getLang(context, "Profile")}")),
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed("login");
            }, child: Text("${getLang(context, "Logout")}"))
          ],),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff001D3D),
        title:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (var enter){
              List result = [];
              if(sear == "${getLang(context, "Name")}"){if(enter.isEmpty)
              {result = home;}
              else
              {result=home.where((user) => user["title"].toLowerCase().contains(enter.toLowerCase())).toList();}

              setState(() {
                homefound = result;
              });}
              if(sear=="${getLang(context, "Category")}"){
                if(enter.isEmpty)
                {result = home;}
                else
                {result=home.where((user) => user["category"].toLowerCase().contains(enter.toLowerCase())).toList();}

                setState(() {
                  homefound = result;
                });
              }
              if(sear=="${getLang(context, "Date")}"){
                if(enter.isEmpty)
                {result = home;}
                else
                {result=home.where((user) => user["expiration_date"].toLowerCase().contains(enter.toLowerCase())).toList();}

                setState(() {
                  homefound = result;
                });
              }
            },
            controller: search,
            decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: '${getLang(context, "Search")}'
            ),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed("add");
        },
        child: Icon(Icons.add,),
        backgroundColor: Color(0xff001D3D),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white),
        child: ListView(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("${getLang(context, "Name")}"),
                    Radio(value: "Name",groupValue:sear,onChanged:(val){
                      setState(() {
                        sear = val;
                      });
                    },),
                  ],
                ),
                Row(
                  children: [
                    Text("${getLang(context, "Category")}"),
                    Radio(value: "Category",groupValue:sear,onChanged:(val){
                      setState(() {
                        sear = val;
                      });
                    },),
                  ],
                ),
                Row(
                  children: [
                    Text("${getLang(context, "Date")}"),
                    Radio(value: "Date",groupValue:sear,onChanged:(val){
                      setState(() {
                        sear = val;
                      });
                    },),
                  ],
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                controller: list,
                itemCount: homefound.length,
                itemBuilder: (context , i){
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    onDismissed: (direction){
                      setState(() {
                        home.removeAt(i);
                      });
                    },
                    key: Key("$i"),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff457B9D),width: 2)
                            ),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Image.asset(home[i]["image"],fit: BoxFit.fill,)),
                                Expanded(
                                  flex: 4,
                                  child: ListTile(title: Center(child: Text("${homefound[i]["title"]}",style: TextStyle(color: Color(0xff457B9D)),)),
                                    subtitle: TextButton(onPressed: (){
                                      setState(() {
                                        home[i]["views"]++;
                                      });
                                      showModalBottomSheet(context: context, builder:(context){
                                        return Container(padding: EdgeInsets.all(10),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                          Row(
                                            children: [
                                              Icon(Icons.date_range),
                                              Text("${homefound[i]["expiration_date"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.category),
                                              Text("${homefound[i]["category"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.countertops_outlined),
                                              SizedBox(),
                                              Text("${homefound[i]["quantity"]}"),
                                              SizedBox(),
                                              IconButton(onPressed: (){
                                                setState(() {
                                                  homefound[i]["quantity"]++;
                                                });
                                              },icon: Icon(Icons.add,color: Color(0xff001D3D),),),
                                              IconButton(onPressed: (){
                                                setState(() {
                                                  homefound[i]["quantity"]--;
                                                });
                                              },icon: Icon(Icons.minimize,color: Color(0xff001D3D),),),

                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.phone),
                                              Text("${homefound[i]["phone"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.facebook),
                                              Text("${homefound[i]["facbook"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.price_change),
                                              Text("${homefound[i]["price"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Icon(Icons.price_change),
                                              Text("${homefound[i]["newPrice"]}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.visibility),
                                              Text("${home[i]["views"]}"),
                                            ],
                                          ),
                                        ],),height: 400,);
                                      });
                                    },child: Text("${getLang(context, "Details")}",style: TextStyle(color:Color(0xff001D3D)),),),
                                    trailing:
                                    IconButton(onPressed: (){
                                      setState(() {
                                        home[i]["like"]=!home[i]["like"];
                                      });
                                    },icon: Icon(home[i]["like"]?Icons.favorite_border:Icons.favorite,color: Colors.red,),),)
                                  ),
                              ],
                            )),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushNamed("comment");
                      }, child: Text("${getLang(context, "comment")}",style: TextStyle(color: Color(0xff001D3D)),))
                      ],
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
