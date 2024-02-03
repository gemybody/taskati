import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

showErrorDialog(context,text){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.redColor,
          content: Text(text)));
}