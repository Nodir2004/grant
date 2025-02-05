// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grant/service/firebase_service.dart';
// import 'package:grant/widget/textFieldWidget.dart';
// import 'package:random_string/random_string.dart';

// class UpdateWidget extends StatefulWidget {
//   final String grand_name;
//   final String category;
//   final String deadline;
//   final String description;
//   final String docId;
//   final Map<String,dynamic>initialData;
//   // final VoidCallback update;
//   UpdateWidget(
//       {super.key,
//       required this.grand_name,
//       required this.category,
//       required this.deadline,
//       required this.description,
//     //  required this.update,
//        required this.docId, required this.initialData});

//   @override
//   State<UpdateWidget> createState() => _UpdateWidgetState();
// }

// TextEditingController _grandnamecontroller = TextEditingController();
// TextEditingController _controllercategory = TextEditingController();

// TextEditingController _controllerdeadline = TextEditingController();

// TextEditingController _controllerdescirption = TextEditingController();

// class _UpdateWidgetState extends State<UpdateWidget> {
//   @override
//   void initState() {
//     _grandnamecontroller =TextEditingController(
//       text: widget.initialData["grand_name"]);
//       _controllercategory =TextEditingController(text: widget.initialData["categoriy"]);
//       _controllerdeadline =TextEditingController(text: widget.initialData["deadline"]);
//       _controllerdescirption = TextEditingController(text: widget.initialData["descirption"]);
//     // _controllercategory.text = widget.category;
//     // _controllerdeadline.text = widget.deadline;
//     // _controllerdescirption.text = widget.description;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final firestoreService =FirebaseService();
//     return
    
//      Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0).r,
//         width: 400.w,
//         height: 330.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(12).r),
//           border: Border.all(),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Grant nomi - ${widget.grand_name}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Text(
//               "Grant turi - ${widget.category}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Text(
//               "Grant vaqti - ${widget.deadline} yil",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Text(
//               "Grant kimlar uchun - ${widget.description}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 12.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                                 content: Container(
//                                   height: 250,
//                                   width: 100,
//                                   child: Column(
//                                     children: [
//                                       Textfieldwidget(
//                                           name: "Grant nomi",
//                                           controller: _grandnamecontroller),
//                                       Textfieldwidget(
//                                           name: "Grant turi",
//                                           controller: _controllercategory),
//                                       Textfieldwidget(
//                                           name: "Grant vaqti",
//                                           controller: _controllerdeadline),
//                                       Textfieldwidget(
//                                           name: "Grant kimlar uchun",
//                                           controller: _controllerdescirption),
//                                     ],
//                                   ),
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("Cancel")),
//                                   TextButton(
//                                       onPressed: () {
//                                         if (_grandnamecontroller.text != "" &&
//                                             _controllercategory.text != "" &&
//                                             _controllerdeadline.text != "" &&
//                                             _controllerdescirption.text != "") {
//                                           String addID = randomAlphaNumeric(10);
//                                           Map<String, dynamic> grantinfo = {
//                                             "name": _grandnamecontroller.text,
//                                             "category":
//                                                 _controllercategory.text,
//                                             "deadline":
//                                                 _controllerdeadline.text,
//                                             "description":
//                                                 _controllerdescirption.text,
//                                           };
//                                           FirebaseService()
//                                               .updateGrant(addID, grantinfo)
//                                               .then((value) {
//                                             _grandnamecontroller.text = "";
//                                             _controllercategory.text = "";
//                                             _controllerdeadline.text = "";
//                                             _controllerdescirption.text = "";
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(SnackBar(
//                                                     backgroundColor:
//                                                         Colors.greenAccent,
//                                                     content: Text(
//                                                       "Malumot saqlandi",
//                                                       style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     )));
//                                           });
//                                         }
//                                       },
//                                       child: Text("Updet"))
//                                 ],
//                               ));
//                     },
//                     icon: Icon(Icons.edit)),
//                 IconButton(onPressed: () {}, icon: Icon(Icons.delete))
//               ],
//             ),
//           ],
//         ));

//   }
// }
