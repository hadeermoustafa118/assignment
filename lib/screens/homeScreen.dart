import 'package:assignment2/components/horCalender.dart';
import 'package:assignment2/components/mainButton.dart';
import 'package:assignment2/cubit/appCubit.dart';
import 'package:assignment2/cubit/appStates.dart';
import 'package:assignment2/presentation/colorManager.dart';
import 'package:assignment2/screens/newTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/clipping.dart';
import '../components/listCard.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: ColorManager.lightColor,
                body: Stack(
                  children: [
                    Container(
                      color: ColorManager.lightColor,
                    ),
                    ClipPath(
                      clipper: Clipping(),
                      child: Container(
                        color: ColorManager.bgColor,
                      ),
                    ),
                    ClipPath(
                      clipper: ClipperContainer(),
                      child: Container(
                        color: ColorManager.bgColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 50)
                          .r,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.barsStaggered,
                                    color: ColorManager.grey,
                                  ),
                                  SizedBox(
                                    width: 20.0.w,
                                  ),
                                  Badge(
                                    position: BadgePosition.topStart(),
                                    child: FaIcon(
                                      FontAwesomeIcons.bell,
                                      color: ColorManager.grey,
                                      size: 30.r,
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 25.r,
                                backgroundImage:
                                    const AssetImage('images/profile.png'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Task',
                                style: TextStyle(
                                    color: ColorManager.txtColor,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              MainButton(
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NewTask()),
                                    );
                                  },
                                  height: 65.h,
                                  child: true,
                                  width: 65.w)
                            ],
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 26.sp),
                              ),
                              Text(
                                'Monday, 1 June',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: ColorManager.grey),
                              )
                            ],
                          ),
                          const HorizontalCalender(),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          SizedBox(
                            height: 380.h,
                            child: Scrollbar(
                              thumbVisibility: true,
                              scrollbarOrientation: ScrollbarOrientation.left,
                              child: ListView.builder(
                                  itemCount:
                                      AppCubit.get(context).titles.length,
                                  itemBuilder: (context, index) {
                                    return ListCard(
                                      title:
                                          AppCubit.get(context).titles[index],
                                      subTitle: AppCubit.get(context)
                                          .subTitles[index],
                                      time: AppCubit.get(context).times[index],
                                      child:
                                          AppCubit.get(context).children[index],
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
