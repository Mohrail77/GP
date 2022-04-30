import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/layout/home_page.dart';
import 'package:graduation_project/models/test_data_list.dart';
import 'package:graduation_project/modules/test_module/result_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<TestScreen> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = const Color.fromRGBO(42, 65, 88, 1.0);
  Color isWrong = const Color.fromRGBO(112, 128, 144, 1.0);
  int score = 0;
  // ignore: deprecated_member_use
  List ans = List(38);
  int count = 0;
  // ignore: non_constant_identifier_names
  bool Arrowshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            'ColorBlindness Test',
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
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0.sp),
                    child: Text(
                      questions[index].question,
                      style: TextStyle(
                        fontSize: 26.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0.h,
                  ),
                  Image(
                    width: 233.0.r,
                    height: 233.0.r,
                    image: AssetImage(
                      questions[index].image,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: Arrowshow,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          iconSize: 50.0.sp,
                          color: Colors.black,
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score, ans),
                                        ),
                                      );
                                    }
                                  : () {
                                      if (index + 1 == questions.length - 1) {
                                        Arrowshow = false;
                                      }
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        curve: Curves.linear,
                                      );
                                    }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                    visible: !Arrowshow,
                    child: SizedBox(
                      height: 60.h,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < questions[index].answer.length; i++)
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 350.0.w,
                          margin: EdgeInsets.only(bottom: 18.0.sp),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0.r),
                            ),
                            color: isPressed
                                ? questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value
                                    ? isTrue
                                    : isWrong
                                : const Color.fromRGBO(112, 128, 144, 1.0),
                            padding: EdgeInsets.symmetric(vertical: 20.0.w),
                            onPressed: isPressed
                                ? () {}
                                : () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    if (questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value) {
                                      score++;

                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                    } else {
                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                    }
                                  },
                            child: Text(
                              questions[index].answer.keys.toList()[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0.sp,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Visibility(
                    visible: !Arrowshow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.sp),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 180.sp,
                            height: 45.sp,
                            child: MaterialButton(
                              elevation: 0.0,
                              color: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                side: BorderSide(
                                  color: const Color.fromRGBO(42, 65, 88, 1.0),
                                  width: 2.w,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0.w,
                                horizontal: 10.0.h,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ResultScreen(score, ans),
                                  ),
                                );
                              },
                              child: Text(
                                'Show result',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
