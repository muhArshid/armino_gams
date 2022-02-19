import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:armino_game/notech_Screen/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(EditScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppColorCode.bgColor,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: new BoxDecoration(
          color: Colors.orange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14),
            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: AppFontMain(
                  color: AppColorCode.whiteshadow,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        AssetConstant.appName,
                      ),
                      ScaleAnimatedText(
                        'Wellcome',
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
