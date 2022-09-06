import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../presentation/colorManager.dart';

class MainButton extends StatelessWidget {

  final double height;
  final Function press;
  final double width;
  bool enable;
  bool child;
  bool colored;
  MainButton(
      {Key? key,
        this.enable = true,
        required this.press,
        required this.height,
        required this.child,
        this.colored= true,
        required this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colored? ColorManager.bgColor: ColorManager.lightColor,
          fixedSize: Size(width.w, height.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0.r),
              side: BorderSide(color: ColorManager.bgColor)
          ),
        ),
        onPressed: () => enable ? press() : null,
        child: child? FaIcon(FontAwesomeIcons.plus, color: colored? ColorManager.lightColor: ColorManager.bgColor,): Text(
          'Create Task',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.lightColor,
          ),
        ),
    );
  }
}
