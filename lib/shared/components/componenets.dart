import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/modules/colorMatch_module/colors_csv_file.dart';
import 'package:graduation_project/modules/colorMatch_module/matched_colors.dart';

// ignore: non_constant_identifier_names
Widget Answer({
  //chatbot answer shape
  @required String message,
}) =>
    Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 55.h,
            width: 55.w,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/robot1.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Bubble(
              radius: Radius.circular(17.0.r),
              color: const Color.fromRGBO(42, 65, 88, 0.9),
              elevation: 0.0,
              child: Padding(
                padding: EdgeInsets.all(5.0.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 250.w),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget send({
  @required String message,
  @required Function function,
}) =>
    Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Bubble(
              radius: Radius.circular(17.0.r),
              color: const Color.fromRGBO(112, 128, 144, 1.0),
              elevation: 0.0,
              child: Padding(
                padding: EdgeInsets.all(3.0.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 294.w),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 28.0.h,
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.0.h,
                              horizontal: 2.0.w,
                            ),
                            onPressed: function,
                            child: Text(
                              message,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 55.r,
            width: 55.r,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/u6.jpeg"),
            ),
          ),
        ],
      ),
    );

Widget about({
  //about shape
  String data,
  double result,
  // ignore: non_constant_identifier_names
  double text_size,
}) =>
    Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 68.0.h,
          horizontal: 40.0.w,
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(35.0.sp),
                  child: Text(
                    data,
                    style: TextStyle(
                      fontSize: text_size,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2.r,
                blurRadius: 2.r,
                offset: Offset(4.h, 5.w),
              ),
            ],
            borderRadius: BorderRadius.circular(40.0.r),
          ),
        ),
      ),
    );

/////////////////////////////////Report////////////////////////////////
Widget buildReport(
  String image,
  String textAnswer,
  String textNormal,
  String textBlind,
) =>
    Row(
      children: [
        Container(
          width: 120.0.sp,
          height: 120.0.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.r),
            border: Border.all(
              color: Colors.grey[300],
              width: 10.w,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ),
            ),
          ),
        ),
        Expanded(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 110.0.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textAnswer,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    textNormal,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0.sp,
                    ),
                    maxLines: 3,
                  ),
                ),
                Expanded(
                  child: Text(
                    textBlind,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

// ignore: non_constant_identifier_names
Widget DividerReport() => Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Container(
        width: double.infinity.w,
        height: 1.0.h,
        color: Colors.grey[300],
      ),
    );

//////////////////////////////////Color Matching//////////////////////////////////////

// ignore: prefer_typing_uninitialized_variables
var colorName;
bool visibleMatchedButton = true;
Widget colorList(
  List model,
  context,
) =>
    Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.sp),
        child: Container(
          width: double.infinity.w,
          ///////////////Hight el container bta3 el matching//////////////////////////////
          height: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0.r),
            color: Colors.grey[300],
          ),
          child: Row(
            children: [
              ///////////////////////////////Circle avatar el color////////////////////////////////
              Padding(
                padding: EdgeInsets.only(left: 8.0.sp),
                child: CircleAvatar(
                  backgroundColor: Color(model[2]),
                  radius: 42.0.r,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Text(
                        '${model[1]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0.sp,
                        ),
                      ),
                    ),
                    Text(
                      '${model[3]}',
                      maxLines: 4,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 10.0.sp, bottom: 15.sp),
                child: Visibility(
                  visible: visibleMatchedButton,
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.0.sp),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const matched_colors(),
                              ),
                            );

                            colorName = model[1];
                            for (int i = 0; i < data.length; i++) {
                              if (data[i][0] == colorName) {
                                matched.insert(0, data[i]);

                                visibleMatchedButton = false;
                              }
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 45.sp,
                            color: const Color.fromRGBO(42, 65, 88, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

////////////////////////////////Card Menu///////////////////////////

// ignore: non_constant_identifier_names
Widget CardMenu({
  @required String title,
  @required String icon,
  Function onTap,
  Color fontColor = Colors.black,
  Color color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: 175.r,
        height: 165.r,
        decoration: BoxDecoration(
          color: color = Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2.r,
              blurRadius: 2.r,
              offset: Offset(4.h, 5.w),
            ),
          ],
          borderRadius: BorderRadius.circular(35.0.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0.w,
              ),
              child: Image.asset(
                icon,
                width: 65.sp,
                height: 65.sp,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0.sp,
                //fontFamily: 'valera',
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
