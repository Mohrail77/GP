import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/layout/home_page.dart';
import 'package:graduation_project/modules/colorMatch_module/basic_colors.dart';

List<List<dynamic>> data = [];
List<List<dynamic>> matched = [];
// ignore: non_constant_identifier_names
List<List<dynamic>> basic_data = [];

// ignore: camel_case_types
class colorsCsvFile extends StatefulWidget {
  const colorsCsvFile({Key key}) : super(key: key);

  @override
  _colorsCsvFileState createState() => _colorsCsvFileState();
}

// ignore: camel_case_types
class _colorsCsvFileState extends State<colorsCsvFile> {
  @override
  void initState() {
    super.initState();
    LoadAsset();
  }

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
            'Color Match',
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
      body: const basic_colors(),
      // ignore: sized_box_for_whitespace
      floatingActionButton: Container(
        height: 35.h,
        width: 40.w,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(42, 65, 88, 1.0),
          child: const Icon(Icons.arrow_upward_rounded),
          onPressed: () {
            controller.animateTo(
              0.0,
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 1),
            );
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  LoadAsset() async {
    final mydata = await rootBundle.loadString("assets/colors.csv");

    data = const CsvToListConverter(
            eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true)
        .convert(mydata)
        .toList();
    for (int i = 0; i < data.length; i++) {
      if (data[i][0] == 'basic') {
        setState(() {
          basic_data.insert(0, data[i]);
        });
      }
    }
  }
}
