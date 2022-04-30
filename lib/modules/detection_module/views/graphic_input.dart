import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:graduation_project/layout/home_page.dart';
import 'package:graduation_project/modules/detection_module/views/color_detection_screen.dart';
import 'package:graduation_project/modules/detection_module/widgets/build_button.dart';
import 'package:image_picker/image_picker.dart';
import 'live_camera.dart';

final liveHomepage livecamera = liveHomepage();

class ImageInputScreen extends StatefulWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
  const ImageInputScreen({@required this.title});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

bool visible = false;

class _ImageInputScreenState extends State<ImageInputScreen> {
  bool imageSelected = false;
  File image;
  String errorMsg = "";

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        imageSelected = true;
      });
    } on PlatformException catch (e) {
      errorMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
            widget.title,
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
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: visible,
        child: FloatingActionButton.extended(
            backgroundColor: const Color.fromRGBO(42, 65, 88, 1.0),
            heroTag: 'uniqueTag',
            label: Row(
              children: const [
                Text('Next  '),
                Icon(Icons.verified_outlined),
              ],
            ),
            onPressed: () {
              imageSelected
                  ? Navigator.push(
                      context,
                      // ignore: missing_return
                      MaterialPageRoute(builder: (context) {
                        if (widget.title == 'Detect Color') {
                          return ColorDetectionScreen(image: image);
                        }
                      }),
                    )
                  : () {};
            }),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 14.h),
                BuildButton(
                  title: 'Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () {
                    pickImage(ImageSource.gallery);
                    visible = true;
                  },
                ),
                SizedBox(height: 14.h),
                BuildButton(
                  title: 'Camera',
                  icon: Icons.camera_alt_outlined,
                  onClicked: () {
                    pickImage(ImageSource.camera);
                    visible = true;
                  },
                ),
                SizedBox(height: 14.h),
                BuildButton(
                  title: '   Live   ',
                  icon: Icons.camera,
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => liveHomepage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 14.h),
                image != null
                    ? Stack(
                        children: [
                          Image.file(
                            image,
                            width: double.infinity,
                            height: size.height * 0.5,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
