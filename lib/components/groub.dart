import 'package:assignment2/cubit/appCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0.r , vertical: 20.0.r),
       child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'images/g1.jpg',
                height: 40.h,
                width: 40.w,
              ),
              SizedBox(width: 5.w,),
              Image.asset(
                'images/g2.jpg',
                height: 40.h,
                width: 40.w,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'images/g1.jpg',
                height: 40.h,
                width: 40.w,
              ),  SizedBox(width: 5.w,),
              Image.asset(
                'images/g2.jpg',
                height: 40.h,
                width: 40.w,
              ),

            ],
          )
        ],
      ),
    );
  }
}
