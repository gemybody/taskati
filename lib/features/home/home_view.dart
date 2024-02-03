import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Widgets/customWidget.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20 ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,Ahmed',style: getTitleStyle(),),
                      Text('Have A Nice Day ',style: getBodyStyle(),),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/user.png'),

                  ),
                ],
              ),
              Gap(20),
              Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMEd().format(DateTime.now()),style: getTitleStyle(color: AppColors.blackColor),),
                      Text('Today ',style: getTitleStyle(color: AppColors.blackColor),),
                    ],
                  ),
                Spacer(),
                SizedBox(
                    height: 50,width: 120,
                    child: CustomButton(text: '+ Add Task', onPressed: (){})),
                ],
              ),
             Gap(20),
              DatePicker(
                height:100,
                width:80,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  //});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
