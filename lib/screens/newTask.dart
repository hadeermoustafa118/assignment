import 'package:assignment2/components/mainButton.dart';
import 'package:assignment2/components/timeField.dart';
import 'package:assignment2/cubit/appCubit.dart';
import 'package:assignment2/presentation/colorManager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/category.dart';
import '../components/dateField.dart';
import '../components/formTitle.dart';
import '../components/mainTextField.dart';
import '../cubit/appStates.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: ColorManager.grey,
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.barsStaggered,
                          color: ColorManager.grey,
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                      ],
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 26.0)
                        .r,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Create New Task',
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  color: ColorManager.txtColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset(
                              'images/clip.png',
                              height: 50.h,
                              width: 50.w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormTitle(
                              text: 'Task Name',
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            MyTextField(
                              //  iconColor: Colors.transparent,
                              tab: () {},
                              hint: 'Team Meeting',
                              controller: cubit.nameController,
                              validatorText: '',
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const FormTitle(
                                  text: 'Select Category',
                                ),
                                TextButton(
                                  child: const Text('See All'),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            SizedBox(
                              height: 32.h,
                              width: 410.w,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.categories.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0).r,
                                      child: InkWell(
                                        onTap: () {
                                          cubit.changeSelected(
                                              cubit.categories[index]);
                                          debugPrint(cubit.selected);
                                          cubit.change(index);
                                        },
                                        child: CategoriesCard(
                                          txtColor: cubit.cat[index]
                                              ? ColorManager.lightColor
                                              : ColorManager.txtColor,
                                          color: cubit.cat[index]
                                              ? ColorManager.midbg
                                              : ColorManager.lightColor,
                                          text: cubit.categories[index],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FormTitle(
                                      text: 'Date',
                                    ),
                                    DateField(
                                      hint: 'Monday, 1 June',
                                      keyboardType: TextInputType.datetime,
                                      controller: cubit.dateController,
                                      validatorText: '',
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  backgroundColor: ColorManager.midbg,
                                  radius: 24.r,
                                  child: FaIcon(
                                    FontAwesomeIcons.calendar,
                                    color: ColorManager.lightColor,
                                    size: 26.r,
                                  ),
                                ),
                                //  SizedBox(width: 0.0.w,),
                              ],
                            ),
                            SizedBox(
                              height: 40.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FormTitle(
                                      text: 'Start Time',
                                    ),
                                    TimeField(
                                      hint: '10:00 AM',
                                      controller: cubit.startController,
                                      validatorText: '',
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FormTitle(
                                      text: 'End Time',
                                    ),
                                    TimeField(
                                      hint: '11:00 AM',
                                      controller: cubit.endController,
                                      validatorText: '',
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            const FormTitle(
                              text: 'Description',
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            MyTextField(
                              hint: 'Discuss all questions about new projects',
                              size: 18,
                              // iconColor: Colors.transparent,
                              tab: () {},
                              controller: cubit.descController,
                              validatorText: '',
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Center(
                              child: MainButton(
                                  press: () {},
                                  height: 56.h,
                                  width: 275.w,
                                  child: false),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
