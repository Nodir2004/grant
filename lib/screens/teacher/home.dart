import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grant/screens/students/home_screen.dart';
import 'package:grant/screens/teacher/getpage.dart';
import 'package:grant/service/firebase_service.dart';
import 'package:grant/widget/drawer_widget.dart';
import 'package:grant/widget/get_widget.dart';
import 'package:grant/widget/textformfield.dart';
import 'package:random_string/random_string.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  final _fromkey = GlobalKey<FormState>();

  TextEditingController deadlinecontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirebaseService();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grant va Stipendiyalar'),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => getPage()));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20).r,
              child: Column(
                children: [
                  Form(
                      key: _fromkey,
                      child: Column(
                        children: [
                          TextformfieldWidget(
                            controller: namecontroller,
                            name: "Grand nomi",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextformfieldWidget(
                            controller: categorycontroller,
                            name: "Qaysi daraja",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextformfieldWidget(
                            controller: deadlinecontroller,
                            name: "Qancha vaqtga",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextformfieldWidget(
                            controller: descriptioncontroller,
                            name: "Kimlar uchun",
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          GetStartedWidget(
                            text: "Yuborish",
                            onPressed: () {
                              if (namecontroller.text != "" &&
                                  categorycontroller.text != "" &&
                                  deadlinecontroller.text != "" &&
                                  descriptioncontroller.text != "") {
                                String addID = randomAlphaNumeric(10);
                                Map<String, dynamic> firebaseFirestore = {
                                  "name": namecontroller.text,
                                  "category": categorycontroller.text,
                                  "deadline": deadlinecontroller.text,
                                  "description": descriptioncontroller.text,
                                };
                                FirebaseService()
                                    .addGrant(firebaseFirestore, addID)
                                    .then((value) {
                                  namecontroller.text = "";
                                  categorycontroller.text = "";
                                  deadlinecontroller.text = "";
                                  descriptioncontroller.text = "";
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.greenAccent,
                                          content: Text(
                                            "Malumot saqlandi",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )));
                                });
                              }
                              ;
                              //        authServices.signUpMethod(
                              // emailcontroller.text, namecontroller.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => getPage()));
                              // if (_fromkey.currentState!.validate()) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text('Processing Data')),
                              //   );
                              // }
                            },
                          )
                        ],
                      )),
                  SizedBox(
                    height: 220.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerWidget());
  }
}
