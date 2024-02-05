import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Widgets/customWidget.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/Widgets/home_header.dart';

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
            HomeHeadder(),
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
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  //});
                },
              ),
              Expanded(child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Flutter Task 1',style: getBodyStyle(color: AppColors.WhiteColor,),),
                          Gap(5),
                          Row(
                            children: [
                              Icon(Icons.watch_off_outlined,color: AppColors.WhiteColor,),
                              Gap(10),
                              Text('12:00 - 12:00',style: getSmallStyle(color: AppColors.greyColor,),),
                            ],
                          ),   Gap(5),
                          Text('Flutter Task 1 Noteeeee',style: getBodyStyle(color: AppColors.WhiteColor,),),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: .5,
                        height: 50,
                        color: AppColors.WhiteColor,
                      ),
                      Gap(5),
                      RotatedBox(
                          quarterTurns: 3,
                          child: Text('TODO',style: getTitleStyle(color: AppColors.WhiteColor,fontsize: 18),)),
                    ],
                  ),
                );

              },)),
            ],
          ),
        ),
      ),
    );
  }
}