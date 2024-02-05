import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/Widgets/custom_error_dialog.dart';
import 'package:taskati/core/utils/Network/local_storage.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/Widgets/customWidget.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/home_view.dart';

String? path;
String name ='';

class UploadView extends StatefulWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: AppColors.WhiteColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {

              if(path != null && name.isNotEmpty){
               Applocal.casheDate(Applocal.IMAGE_key, path);
               Applocal.casheDate(Applocal.NAME_key, name);
               Applocal.casheDate(Applocal.IMAGE_key, true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeView()));
              }else if(path==null && name.isNotEmpty){
                showErrorDialog(context, 'Please Upload Your Image');
              }else if(path !=null && name.isEmpty){
                showErrorDialog(context, 'Enter Your Name');
              }else{
                showErrorDialog(context, 'Plaese upload Your Image And Your Name');

              }
            },
            child: Text(
              'Done',
              style: getSmallStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: (path != null) ? FileImage(
                      File(path!)) as ImageProvider :


                  AssetImage('assets/user.png'),
                ),
                Gap(5),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: CustomButton(
                    text: 'Upload From Camera',
                    onPressed: () {
                      uploadFromCamera();
                    },
                  ),
                ),
                Gap(7),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: CustomButton(
                    text: 'Upload From Gallery', // Fixed the text here
                    onPressed: () {
                      UploadFromCamera();
                    },
                  ),
                ),
                Gap(20),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  thickness: 0.5,
                  color: AppColors.primaryColor,
                ),
                Gap(20),
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))],
                  onChanged: (value) {
                    setState(() {
                      name=value;
                    });

                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.redColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.redColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    var pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }


  UploadFromCamera() async {
    var pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}