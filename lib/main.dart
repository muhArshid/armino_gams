import 'package:armino_game/constants.dart';
import 'package:armino_game/controller/app_state_controller.dart';
import 'package:armino_game/notech_Screen/splash_screen.dart';
import 'package:armino_game/view/Screen/Home/main_home_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppStateController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' MY Gams',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
        ),
        home: SplashScreen(),
      );
    });
  }
}
