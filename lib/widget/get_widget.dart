import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class GetStartedWidget extends StatefulWidget {
  String text;
  void Function() onPressed;
  GetStartedWidget({super.key, required this.text, required this.onPressed});

  @override
  State<GetStartedWidget> createState() => _GetStartedWidgetState();
}

class _GetStartedWidgetState extends State<GetStartedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 55.h,
      decoration: BoxDecoration(
          color: Color(0xff3422F2), borderRadius: BorderRadius.circular(28).w),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff3422F2))),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
