import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project/appLocal.dart';

import 'main.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}
class _AddState extends State<Add> {
  List add=[];
  TextEditingController time = new TextEditingController();
  TextEditingController quant = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController facebook = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController price = new TextEditingController();
  var SelectedCategory;
  late File image;
  final imagepicker = ImagePicker();
  DateTime date = DateTime.now();
  getText() {
    if (date == null) {
      return time.text = "Select date";
    }
    else {
      time.text = "${date.day}/${date.month}/${date.year}";
    }
  }
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context, initialDate: initialDate,
        firstDate: DateTime(DateTime
            .now()
            .year - 1),
        lastDate: DateTime(DateTime
            .now()
            .year + 1));
    if (newDate == null) {
      return;
    }
    setState(() => date = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001D3D),
        title: Text("${getLang(context, "AI")}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Form(child: Column(children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline,
                          color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Name")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),

                child: TextFormField(
                  readOnly: true,
                  controller: time,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(onPressed: () async {
                        final initialDate = DateTime.now();
                        final newDate = await showDatePicker(
                            context: context, initialDate: initialDate,
                            firstDate: DateTime(DateTime
                                .now()
                                .year - 1),
                            lastDate: DateTime(DateTime
                                .now()
                                .year + 1));
                        if (newDate == null) {
                          return;
                        }
                        setState(() => date = newDate);
                      }
                        ,
                        icon: Icon(
                            Icons.date_range, color: Color(0xff457B9D)),),
                      labelText: getText(),
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff457B9D), width: 1),
                    borderRadius: BorderRadius.circular(5)
                ),
                margin: EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 3, bottom: 3),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.category, color: Color(0xff457B9D),),
                    DropdownButton(items: [
                      "${getLang(context, "Food")}",
                      "${getLang(context, "Drinks")}",
                      "${getLang(context, "MakeUp")}",
                      "${getLang(context, "Medicines")}"
                    ]
                        .map((e) =>
                        DropdownMenuItem(child: Text("$e"), value: e,))
                        .toList(),
                      onChanged: (val) {
                        setState(() {
                          SelectedCategory = val;
                        });
                      },
                      value: SelectedCategory,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: facebook,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.facebook,
                          color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Facebook")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Phone")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.price_change,
                          color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Price")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: quant,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.countertops_outlined,
                          color: Color(0xff457B9D)),
                      labelText: "${getLang(context, "Quantity")}",
                      labelStyle: TextStyle(color: Color(0xff457B9D)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 1, color: Color(0xff457B9D)))
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  //color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xff457B9D), width: 2)
                ),
                child: Center(
                  child: IconButton(onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        height: 150,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${getLang(context, "CIF")}", style: TextStyle(
                                color: Color(0xff001D3D),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Divider(),
                            InkWell(
                              onTap: () async {
                                var pickedimage = await imagepicker.pickImage(
                                    source: ImageSource.camera);
                                if (pickedimage != null) {
                                  setState(() {
                                    image = File(pickedimage.path);
                                  });
                                }
                                else {}
                              },
                              child: Row(children: [
                                Icon(Icons.camera),
                                Text("${getLang(context, "Camera")}")
                              ],),
                            ),
                            Divider(),
                            InkWell(
                              onTap: () async {
                                var pickedimage = await imagepicker.pickImage(
                                    source: ImageSource.gallery);
                                if (pickedimage != null) {
                                  setState(() {
                                    image = File(pickedimage.path);
                                  });
                                }
                                else {}
                              },
                              child: Row(children: [
                                Icon(Icons.photo),
                                Text("${getLang(context, "Gallery")}")
                              ],),
                            ),
                          ],),
                      );
                    });
                  }, icon: Icon(Icons.camera, color: Color(0xff457B9D)),),
                ),
              ),
              Divider(),
              Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xff001D3D)),
                  child: IconButton(onPressed: () {
                    add.add(name.text);
                    add.add(time.text);
                    add.add(facebook.text);
                    add.add(phone.text);
                    add.add(price.text);
                    add.add(image);
                    add.add(SelectedCategory);
                    print(add);
                  }, icon: Icon(Icons.add, color: Colors.white,)))
            ],))
          ],),
        ),
      ),
    );
  }
}
