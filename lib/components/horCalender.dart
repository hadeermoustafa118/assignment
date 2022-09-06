import 'package:assignment2/presentation/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var nameController = FixedExtentScrollController();


class HorizontalCalender extends StatelessWidget {
  const HorizontalCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
        child: CalendarTimeline(
          initialDate: DateTime(2022, 6, 1),
          firstDate: DateTime(2022, 6, 1),
          lastDate: DateTime(2024, 11, 20),
          onDateSelected: (date) {},
          leftMargin: 10.r,
          monthColor: Colors.transparent,
          dayColor: ColorManager.txtColor,
          activeDayColor: ColorManager.lightColor,
          activeBackgroundDayColor: ColorManager.bgColor,
          dotsColor: ColorManager.bgColor,
          locale: 'en_ISO',
        ));
  }
}
