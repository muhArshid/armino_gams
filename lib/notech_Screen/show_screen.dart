import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/controller/main_condroller.dart';
import 'package:armino_game/notech_Screen/edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    final ct = Get.put(MainController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Stack(children: [
          Positioned(
              top: size.height * 0.10,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(children: [
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Users',
                    style: AppFontMain(
                      color: AppColorCode.brandColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Obx(
                      () => Container(
                          height: 60.h * ct.users.length,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: ct.users.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ItemDetils(ct.users[index]))),
                    )),
                SizedBox(height: 15.h),
                if (ct.users.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      'Not Found List',
                      style: AppFontMain(
                        color: AppColorCode.brandColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ]))
        ]));
  }
}

Widget ItemDetils(MemberLogin data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          color: AppColorCode.gradient1,
          borderRadius: BorderRadius.circular(30)),
      height: 10.h,
      width: 80.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              data.addres!,
              style: AppFontMain(
                color: AppColorCode.labelColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Text(
                  'Email  :',
                  style: AppFontMain(
                    color: AppColorCode.labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  data.email!,
                  style: AppFontMain(
                    color: AppColorCode.labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
