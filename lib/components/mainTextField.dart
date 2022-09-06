import 'package:assignment2/presentation/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String validatorText;
  final bool obsecure;
  final TextInputType keyboardType;
  final bool isMulti;
  final bool autofocus;
  final double width;
  final String hint;
  final bool enabled;
  final Function tab;
  final double size;
  const MyTextField(
      {Key? key,
      this.hint = '',
      required this.controller,
      required this.validatorText,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.isMulti = false,
      this.autofocus = false,
      this.enabled = true,
      required this.tab,
      this.width = double.infinity,
      this.size = 22})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.h,
      child: TextFormField(
        autofocus: autofocus,
        onTap:tab(),
        minLines: isMulti ? 4 : 1,
        maxLines: isMulti ? null : 1,
        enabled: enabled,
        obscureText: obsecure,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          }
          return null;
        },
        cursorColor: ColorManager.txtColor,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: ColorManager.txtColor,
              fontWeight: FontWeight.bold,
              fontSize: size.sp),
          hintText: hint,
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.lightbg, width: 2)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.lightbg, width: 2)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0).r,
        ),
        style: TextStyle(
            fontSize: size.sp,
            color: ColorManager.txtColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
