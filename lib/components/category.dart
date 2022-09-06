import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/colorManager.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({Key? key, required this.text, required this.color, required this.txtColor}) : super(key: key);
  final String text;
  final Color color;
  final Color txtColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0.r),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8).r),
      color: color,
      border: Border.all(color: ColorManager.lightbg)),
      child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text(text, style: TextStyle(color: txtColor),),
      ),
    );
  }
}
