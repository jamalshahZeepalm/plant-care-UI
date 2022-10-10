import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyle {
  static TextStyle kHeadingTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(22),
    fontWeight: FontWeight.w800,
    letterSpacing: 2,
  );
  static TextStyle ksubTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );
}
