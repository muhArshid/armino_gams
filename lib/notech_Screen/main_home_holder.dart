// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';


// class MainHomeHolder extends StatefulWidget {
//   final int? currentIndex;
//   MainHomeHolder({this.currentIndex, Key? key}) : super(key: key);

//   @override
//   _MainHomeHolderState createState() => _MainHomeHolderState();
// }

// class _MainHomeHolderState extends State<MainHomeHolder> {
//   int currentIndex = 0;
//   // MainController mainCt = Get.find();

//   @override
//   void initState() {
//     if (widget.currentIndex != null) {
//       currentIndex = widget.currentIndex!;
//     }
//     super.initState();
//   }

//   Widget callpage(int currentIndex) {
//     switch (currentIndex) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return JobScreen();
//       case 2:
//         return ProfileScreen();

//       default:
//         return TextPage();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     void onTabTapped(int index) {
//       setState(() {
//         currentIndex = index;
//       });
//     }

//     BottomNavigationBarItem bottomNavigationBarItem(
//             {int? index, String? icon, String? label, String? activeIcon}) =>
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             icon!,
//             color: currentIndex == index
//                 ? AppColorCode.primaryText
//                 : AppColorCode.butColor,
//             height: 20,
//           ),
//           label: label,
//           activeIcon: SvgPicture.asset(
//             activeIcon!,
//             color: currentIndex == index
//                 ? AppColorCode.primaryText
//                 : AppColorCode.butColor,
//             height: 30,
//           ),
//         );

//     DateTime? _lastQuitTime;
//     return WillPopScope(
//       onWillPop: () async {
//         if (_lastQuitTime == null ||
//             DateTime.now().difference(_lastQuitTime!).inSeconds > 2) {
//           Fluttertoast.showToast(
//               msg: 'Press again Back Button exit',
//               backgroundColor: AppColorCode.brandColor);
//           Get.back();
//           _lastQuitTime = DateTime.now();
//           return false;
//         } else {
//           print('Exited');
//           Get.back(result: true);
//           return true;
//         }
//       },
//       child: Scaffold(
//         backgroundColor: AppColorCode.backgroundColor,
//         body: callpage(currentIndex),
//         bottomNavigationBar: new BottomNavigationBar(
//           backgroundColor: AppColorCode.backgroundColor,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           onTap: onTabTapped,
//           currentIndex: currentIndex,
//           fixedColor: Colors.black,
//           items: <BottomNavigationBarItem>[
//             bottomNavigationBarItem(
//                 index: 0,
//                 activeIcon: AssetConstant.home,
//                 label: 'Home',
//                 icon: AssetConstant.home_inactive),
//             bottomNavigationBarItem(
//                 index: 1,
//                 activeIcon: AssetConstant.services,
//                 label: 'Services',
//                 icon: AssetConstant.services_inactive),
//             bottomNavigationBarItem(
//                 index: 2,
//                 activeIcon: AssetConstant.profile,
//                 label: 'Profile',
//                 icon: AssetConstant.profile_inactive),
//           ],
//         ),
//       ),
//     );
//   }
// }
