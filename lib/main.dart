import 'package:assignment2/screens/homeScreen.dart';
import 'package:assignment2/screens/newTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(411.4, 820.6),
      builder: (context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
        );
      },
    );
  }
}

