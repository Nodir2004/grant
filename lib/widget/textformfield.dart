import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextformfieldWidget extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
   TextformfieldWidget({super.key, required this.name, required this.controller});

  @override
  State<TextformfieldWidget> createState() => _TextformfieldWidgetState();
}

class _TextformfieldWidgetState extends State<TextformfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 350.w,
      child: TextFormField(controller:widget.controller ,
      
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
            hintText: widget.name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(26).r)),
      ),
    );
  }
}
