import 'dart:convert';

import 'package:get/get.dart';

class AppStateController extends GetxController {
  String? fcmToken;
  String? bearetoken = 'a9rt343n3axkyaycgm9w5r5ubjeldb';
  String? get token => bearetoken;
  bool isFirstTime = true;
  bool get isAuth => bearetoken != null;
}
