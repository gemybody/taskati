import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/Network/local_storage.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';

class HomeHeadder extends StatefulWidget {
  const HomeHeadder({super.key});

  @override
  State<HomeHeadder> createState() => _HomeHeadderState();
}
String? name;
String? path;

class _HomeHeadderState extends State<HomeHeadder> {
  @override
  void initState() {

    super.initState();
   path = Applocal.getcashedDate(Applocal.IMAGE_key);
   name = Applocal.getcashedDate(Applocal.NAME_key);
  }
  @override
  Widget build(BuildContext context) {
    return     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,$name',style: getTitleStyle(),),
            Text('Have A Nice Day ',style: getBodyStyle(),),
          ],
        ),
        CircleAvatar(
          backgroundImage: path != null
              ? FileImage(File(path!)) as ImageProvider
              :  AssetImage('assets/user.png'),
        )
      ],
    );
  }
}
