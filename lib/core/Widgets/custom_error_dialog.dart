import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

showErrorDialog(context,text){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          backgroundColor: AppColors.redColor,
          content: Text(text)));
}