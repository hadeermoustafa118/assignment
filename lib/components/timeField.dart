import 'package:flutter/material.dart';
import 'package:assignment2/presentation/colorManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeField extends StatelessWidget {
  final TextEditingController controller;
  final String validatorText;
  final bool obsecure;
  final TextInputType keyboardType;
  final bool isMulti;
  final bool autofocus;
  final String hint;
  final bool enabled;

  final double size;
  const TimeField(
      {Key? key,
      this.hint = '',
      required this.controller,
      required this.validatorText,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.isMulti = false,
      this.autofocus = false,
      this.enabled = true,
      this.size = 22})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      height: 40.h,
      child: TextFormField(
        autofocus: autofocus,
        onTap: () {
          showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
              (value) => controller.text =
                  '${value!.hourOfPeriod.toString()}:${value.minute.toString()} ${value.period.name.toUpperCase().toString()}');
        },
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
          suffixIcon: SizedBox(
              height: 20.h,
              child: FaIcon(
                FontAwesomeIcons.chevronDown,
                color: ColorManager.lightbg,
              )),
          fillColor: Colors.white,
          suffixIconConstraints: const BoxConstraints(),
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
