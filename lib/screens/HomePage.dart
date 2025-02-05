import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grant/screens/students/home_screen.dart';
import 'package:grant/screens/teacher/home.dart';
import 'package:grant/widget/drawer_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
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
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeacherHomePage()));
              },
              child: Container(
                width: 150.w,
                height: 150.h,
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.indigo),
                child: Center(
                  child: Text(
                    'Oqituchi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudenHomePage()));
              },
              child: Container(
                width: 150.w,
                height: 150.h,
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.indigo),
                child: Center(
                  child: Text(
                    'Talaba',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        drawer: DrawerWidget());
  }
}
