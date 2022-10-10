import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Uitls/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,required this.voidCallback,
      required this.color,
      required this.mywidget,
      required this.wdith,
      required this.height})
      : super(key: key);
  final Widget mywidget;
  final double wdith, height;
  final Color color;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback ,
      child: Container(
        width: wdith.w,
        height: height.h,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
        child: mywidget,
      ),
    );
  }
}
