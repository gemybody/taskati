import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/utils/text_styles.dart';

import '../upload/uploadView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      Future.delayed(Duration(seconds: 4),
          (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>UploadView(),));
          }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Lottie.asset('assets/logo.json',width: 250,),
            Gap(15),
            Text('Taskati',style:getTitleStyle(fontWeight: FontWeight.bold ,color: Colors.black),),
    Gap(20),
            Text('it is time to be orgnized',style: getSmallStyle(),),
          ],
        ),
      ),
    );
  }
}
