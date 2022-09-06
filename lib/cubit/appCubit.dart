import 'package:assignment2/components/groub.dart';
import 'package:assignment2/components/mainButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<String> categories = [
    'Development',
    'Research',
    'Design',
    'Backend',
    'Frontend',
    'Flutter',
    'Ui/Ux'
  ];
  List<bool> cat = [true,false,false,false,false,false,false,];

  void change(item) {
    for(int i =0;i< cat.length;i++){
      cat[i] = false;
    }
    cat[item]= !cat[item];
    emit(ChangeState());
  }

  String selected = 'Development';
  void changeSelected(String item) {
    selected = item;

    debugPrint(categories.indexOf(selected).toString());

    emit(ChangeSelectedState());
  }

  var nameController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var descController = TextEditingController();

  var dateController = TextEditingController();

  List<Widget> children = [
    const Group(),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.r, vertical: 20.0.r),
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          'images/call.png',
        ),
        radius: 35.r,
      ),
    ),
    Padding(
      padding:
          EdgeInsets.only(right: 50.0.r, left: 30.r, top: 20.0.r, bottom: 20.r),
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          'images/mail.jpg',
        ),
        radius: 35.r,
      ),
    ),
  ];
  List<String> titles = ['Team Meeting', 'Call The Stylist', 'Check Mail'];
  List<String> subTitles = [
    '''Discuss all question
 about new projects''',
    'Agree on the evening look',
    'Write to the manager'
  ];
  List<String> times = ['10:00 AM', '11:00 AM', '06:20 PM'];
}
