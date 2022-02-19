import 'dart:convert';
import 'dart:io';
import 'package:armino_game/notech_Screen/edit_page.dart';
import "package:http/http.dart" as http;

import 'package:get/get.dart';
import 'package:http/io_client.dart';

class MainController extends GetxController {
  RxList<MemberLogin> users = <MemberLogin>[].obs;
  addLogin(MemberLogin getList) {
    users.add(getList);

    update();
  }
}
