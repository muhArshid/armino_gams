import 'dart:convert';
import 'package:armino_game/Widget/common_dialogs.dart';
import 'package:armino_game/controller/app_state_controller.dart';
import 'package:armino_game/model/core/error_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'HttpConstants.dart';

class HttpRequestHandler {
  String requestType = 'POST';
  late List<dynamic> responsebody;
  ErrorResponse? error;

  Future<bool> sendTokenServerRequest(String urlExtension, dynamic body) async {
    AppStateController controller = Get.find();
    var token = controller.token;
    print(token);
    print(urlExtension);
    print(body);
    var isScuccess;
    var response = await http.post(Uri.parse(urlExtension),
        body: body,
        headers: token == null
            ? {"Accept": "application/json", "content-type": "application/json"}
            : {
                "Client-ID": 'pkkekekt9u0zu6prgbbs1w8n76j3qo',
                "Authorization": "Bearer a9rt343n3axkyaycgm9w5r5ubjeldb"
              });
    print('response code');

    print(response.statusCode);
    print(response.body);
    if (response.body.isNotEmpty) {
      var resData = jsonDecode(response.body) as List<dynamic>;
      responsebody = resData;
    }
    if (response.statusCode == 200 || response.statusCode == 204) {
      isScuccess = true;
    } else if (response.statusCode == 400) {
      // if (responsebody.containsKey('responseMessage')) {
      print(response.body);
      //  error = ErrorResponse.fromJson(responsebody);
      print(error?.responseMessage);
      // ignore: unnecessary_null_comparison
      if (error?.responseMessage != null && responsebody != null) {
        Get.dialog(errorDialog(error?.responseMessage ?? ''));
      } else {
        Get.dialog(errorDialog('Something went wrong'));
        // }
      }
      isScuccess = false;
    } else {
      isScuccess = false;
      Get.dialog(errorDialog('Something went wrong'));
    }
    return isScuccess;
  }
}
