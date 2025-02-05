import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grant/models/grant.dart';
import 'package:grant/screens/themeProvider.dart';

import 'package:grant/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

class getPage extends StatefulWidget {
  const getPage({super.key});

  @override
  State<getPage> createState() => _getPageState();
}

class _getPageState extends State<getPage> {
  @override
  Widget build(BuildContext context) {
    getGrantStream() => FirebaseFirestore.instance
        .collection("Grant")
        .where("docId", isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();

    final themeProvider = Provider.of<ThemeProvider>(context);
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
            Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                })
          ],
        ),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20)
                    .r,
            child: StreamBuilder(
                stream: getGrantStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  ;
                  if (snapshot.hasData) {
                    List<GrantModel> name = snapshot.data!.docs
                        .map((e) => GrantModel.fromJson(e.data()))
                        .toList();
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: name.length,
                      itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 15, bottom: 15),
                          width: 400.w,
                          height: 350.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Grant nomi - ${name[index].name}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "Grant turi - ${name[index].category}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "Grant vaqti - ${name[index].deadline} yil",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "Grant kimlar uchun - ${name[index].description}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    );
                  }

                  return Container();
                }),
          ),
        ),
        drawer: DrawerWidget());
  }
}
