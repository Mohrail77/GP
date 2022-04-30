import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/layout/home_page.dart';
import 'package:graduation_project/modules/detection_module/helper/color_converter.dart';
import 'package:graduation_project/modules/detection_module/views/graphic_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'dart:io';
import '../widgets/dropper.dart';

// ignore: non_constant_identifier_names
var color_name = 'color name not found';
// ignore: non_constant_identifier_names
var color_meaning = 'No color meaning available';
List<List<dynamic>> data = [];
List<List<dynamic>> data1 = [];

// ignore: must_be_immutable
class ColorDetectionScreen extends StatefulWidget {
  File image;
  ColorDetectionScreen({Key key, @required this.image}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ColorDetectionScreenState();
  }
}

class _ColorDetectionScreenState extends State<ColorDetectionScreen> {
  final picker = ImagePicker();
  Positioned dropper = Positioned(
    // ignore: sized_box_for_whitespace
    child: Container(width: 0.0, height: 0.0),
  );
  Color currentSelection;
  String colorHex;
  bool colorSelected = false;

  void _screenTouched(dynamic details, ImgDetails img, RenderBox box) {
    double widgetScale = box.size.width / img.width;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    var x = (localOffset.dx / widgetScale).round();
    var y = (localOffset.dy / widgetScale).round();
    bool flippedX = box.size.width - localOffset.dx < Dropper.totalWidth;
    bool flippedY = localOffset.dy < Dropper.totalHeight;
    if (box.size.height - localOffset.dy > 0 && localOffset.dy > 0) {
      currentSelection = img.pixelColorAt(x, y);
      colorHex = colourToHex(currentSelection.toString());
      colorSelected = true;
      setState(() {
        _createDropper(
          localOffset.dx,
          box.size.height - localOffset.dy,
          img.pixelColorAt(x, y),
          flippedX,
          flippedY,
        );
      });
    }
    if (colorSelected) {
      if (currentSelection != null && widget.image != null) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF737373),
              child: Container(
                height: 140.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0.sp),
                            child: Container(
                              width: 40.sp,
                              height: 40.sp,
                              decoration: BoxDecoration(
                                color: currentSelection,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(color_name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0.h,
                          horizontal: 14.0.w,
                        ),
                        child: Text(
                          color_meaning,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
        var hex = colorHex;
        LoadAsset(hex);
      }
    } else {}
  }

  void _createDropper(
      left, bottom, Color colour, bool flippedX, bool flippedY) {
    dropper = Positioned(
      left: left,
      bottom: bottom,
      child: Dropper(
        colour,
        flippedX,
        flippedY,
        'color',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.sp),
        child: AppBar(
          // ignore: deprecated_member_use
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),

          title: Text(
            'Color selection',
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
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 30.sp,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          actions: [
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: IconButton(
                color: Colors.white,
                iconSize: 35.sp,
                icon: const Icon(Icons.home_rounded),
                onPressed: () {
                  setState(() {
                    visible = false;
                  });
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
      body: Center(
        child: Stack(
          children: <Widget>[
            ImagePixels(
                imageProvider: FileImage(widget.image),
                builder: (BuildContext context, ImgDetails img) {
                  return GestureDetector(
                    child: Image.file(widget.image),
                    onPanUpdate: (DragUpdateDetails details) {
                      _screenTouched(details, img,
                          context.findRenderObject() as RenderBox);
                    },
                    onTapDown: (TapDownDetails details) {
                      _screenTouched(details, img,
                          context.findRenderObject() as RenderBox);
                    },
                  );
                }),
            dropper,
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  LoadAsset(var hex) async {
    final mydata1 = await rootBundle.loadString("assets/detect.csv");
    final mydata = await rootBundle.loadString("assets/colors.csv");

    data1 = const CsvToListConverter(
            eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true)
        .convert(mydata1)
        .toList();
    data = const CsvToListConverter(
            eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true)
        .convert(mydata)
        .toList();
    for (int i = 0; i < data1.length; i++) {
      if (data1[i][0].toString() == hex) {
        color_name = data1[i][1];
        break;
      } else {
        color_name = 'color name not found';
      }
    }

    for (int i = 0; i < data.length; i++) {
      if (data[i][1] == color_name) {
        color_meaning = data[i][3];
        break;
      } else {
        color_meaning = 'No color meaning available';
      }
    }
  }
}
