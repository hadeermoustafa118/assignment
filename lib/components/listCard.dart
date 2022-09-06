import 'package:assignment2/presentation/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCard extends StatelessWidget {
  const ListCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.time,
      required this.child})
      : super(key: key);
  final String title;
  final String subTitle;
  final String time;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.r),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 150.h,
            ),
          ),
          Center(
            child: Container(
              height: 120.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: ColorManager.lightColor,
              ),
              child: Row(
                children: [
                  child,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(color: ColorManager.lightbg),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.r,
            top: 95.r,
            child: Container(
              height: 45.h,
              width: 120.w,
              decoration: BoxDecoration(
                  color: ColorManager.txtColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: Center(
                  child: Text(
                time,
                style: TextStyle(
                    color: ColorManager.lightColor,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
