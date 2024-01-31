import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/Widgets/customWidget.dart';
import 'package:taskati/core/utils/text_styles.dart';

String? path;

class UploadView extends StatefulWidget {
  const UploadView({Key? key}) : super(key: key);

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.WhiteColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: getSmallStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
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