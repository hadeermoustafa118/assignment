import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/colorManager.dart';
class FormTitle extends StatelessWidget {
  const FormTitle({Key? key, required this.text, this.fontSize= 18}) : super(key: key);
final String text;
final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: ColorManager.bgColor,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w500),
    );
  }
}
