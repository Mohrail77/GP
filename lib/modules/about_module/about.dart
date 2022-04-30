import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/layout/home_page.dart';
import 'package:graduation_project/shared/components/componenets.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.sp),
        child: AppBar(
          // ignore: deprecated_member_use
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'About us !',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color.fromRGBO(42, 65, 88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
          ),
          ////////////////////////////HOME BUTTON/////////////////////////////
          actions: [
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: IconButton(
                color: Colors.white,
                iconSize: 35.sp,
                icon: const Icon(Icons.home_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          about(
            text_size: 19.sp,
            data:
                'Welcome to Color Hermony!\nWe are a group of six and we all students at faculty of computer science and artificial intelligence Helwan university, we made this application as a graduation project mainly to support color blindness people and to help them with their daily routine.\nWe tried to build the perfect whole application that has all needed features for making life a little bit easier for color blindness people.\nWe know that you are not a minor faction and it was not easy for you and we care alot about you.\nHope you all find this application as useful as we expect it to be.',
          )
        ],
      ),
    );
  }
}
