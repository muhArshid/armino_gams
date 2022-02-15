import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:armino_game/view/Screen/Home/calender_screen.dart';
import 'package:armino_game/view/Screen/Home/fav_items_screen.dart';
import 'package:armino_game/view/Screen/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainHomeHolder extends StatefulWidget {
  final int? currentIndex;
  MainHomeHolder({this.currentIndex, Key? key}) : super(key: key);

  @override
  _MainHomeHolderState createState() => _MainHomeHolderState();
}

class _MainHomeHolderState extends State<MainHomeHolder> {
  int currentIndex = 0;

  @override
  void initState() {
    if (widget.currentIndex != null) {
      currentIndex = widget.currentIndex!;
    }
    super.initState();
  }

  Widget callpage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return CalenderScreen();
      case 2:
        return FavItemScreen();

      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      if (index == 3) {
        showBarModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            color: Colors.white,
            child: CalenderScreen(),
          ),
        );
        setState(() {
          currentIndex = index;
        });
      } else {
        setState(() {
          currentIndex = index;
        });
      }
    }

    BottomNavigationBarItem bottomNavigationBarItem(
            {int? index, String? icon, String? label, String? activeIcon}) =>
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icon!,
            color: currentIndex == index
                ? AppColorCode.brandColor
                : AppColorCode.subHeaderColor,
            height: 20,
          ),
          label: label,
          activeIcon: Column(
            children: [
              Container(
                height: 1.h,
                width: 20.w,
                decoration: BoxDecoration(color: AppColorCode.brandColor),
              ),
              const SizedBox(
                height: 5,
              ),
              SvgPicture.asset(
                activeIcon!,
                color: currentIndex == index
                    ? AppColorCode.brandColor
                    : AppColorCode.subHeaderColor,
                height: 30,
              ),
            ],
          ),
        );

    DateTime? _lastQuitTime;
    return WillPopScope(
      onWillPop: () async {
        if (_lastQuitTime == null ||
            DateTime.now().difference(_lastQuitTime!).inSeconds > 2) {
          Fluttertoast.showToast(
              msg: 'Press again Back Button exit',
              backgroundColor: AppColorCode.brandColor);
          Get.back();
          _lastQuitTime = DateTime.now();
          return false;
        } else {
          print('Exited');
          Get.back(result: true);
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: AppColorCode.bgColor,
        body: callpage(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColorCode.backgroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: currentIndex,
          fixedColor: Colors.black,
          items: <BottomNavigationBarItem>[
            bottomNavigationBarItem(
                index: 0,
                activeIcon: AssetConstant.home,
                label: '',
                icon: AssetConstant.home),
            bottomNavigationBarItem(
                index: 1,
                activeIcon: AssetConstant.calender,
                label: '',
                icon: AssetConstant.calender),
            bottomNavigationBarItem(
                index: 2,
                activeIcon: AssetConstant.fav,
                label: '',
                icon: AssetConstant.fav),
          ],
        ),
      ),
    );
  }
}
