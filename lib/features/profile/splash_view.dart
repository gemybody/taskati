import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/utils/Network/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/home_view.dart';

import '../upload/uploadView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
      super.initState();
     var isupload= Applocal.getcashedDate(Applocal.ISUPLOAD_key)??false;
    print( Applocal.getcashedDate(Applocal.IMAGE_key)) ;
      print(Applocal.getcashedDate(Applocal.NAME_key));


      Future.delayed(Duration(seconds: 4),
          (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=> isupload? const HomeView(): const UploadView(),));
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
