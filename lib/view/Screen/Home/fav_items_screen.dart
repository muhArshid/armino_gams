import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/Widget/button_icons_widgets.dart';
import 'package:armino_game/controller/game_controller.dart';
import 'package:armino_game/view/Screen/Home/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class FavItemScreen extends StatefulWidget {
  FavItemScreen({Key? key}) : super(key: key);

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  final ct = Get.put(GameCtr());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColorCode.backgroundColor,
        body: Stack(children: [
          Positioned(
            top: size.height * 0.10,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              children: [
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Favorits',
                    style: AppFontMain(
                      color: AppColorCode.brandColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                ct.myFavList.length != null
                    ? Padding(
                        padding: EdgeInsets.all(8),
                        child: Obx(
                          () => Container(
                              height: 60.h * ct.myFavList.length,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: ct.myFavList.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      ItemDetils(data: ct.myFavList[index]))),
                        ))
                    : Center(
                        child: Text(
                          'Not Found List',
                          style: AppFontMain(
                            color: AppColorCode.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: appBar(
              label: 'John',
            ),
          ),
        ]));
  }
}
