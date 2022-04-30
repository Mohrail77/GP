import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/shared/components/componenets.dart';
import 'colors_csv_file.dart';

var controller = ScrollController();

// ignore: camel_case_types
class basic_colors extends StatelessWidget {
  const basic_colors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemBuilder: (context, int index) =>
          colorList(basic_data[index], context),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(start: 20.0.sp),
        child: Container(
          width: double.infinity.w,
          height: 1.0.h,
          color: Colors.grey[300],
        ),
      ),
      itemCount: basic_data.length,
    );
  }
}
