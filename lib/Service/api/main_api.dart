import 'package:armino_game/Service/network/HttpConstants.dart';
import 'package:armino_game/Service/network/HttpRequestHandler.dart';
import 'package:armino_game/model/core/games_modal_res.dart';
import 'package:get/get.dart';

class GeneralAPI {
  static Future<List<GetGames>?> getGames(dynamic data) async {
    try {
      List<GetGames>? mainResponse;
      HttpRequestHandler requestHandler = HttpRequestHandler();

      var isSuccess = await requestHandler.sendTokenServerRequest(
          HttpConstants.baseUrl, data);

      if (isSuccess) {
        List resBody = requestHandler.responsebody;

        mainResponse = resBody.map((game) => GetGames.fromJson(game)).toList();
      }
      return mainResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<GameDetails>?> getGameDetails(dynamic data) async {
    try {
      List<GameDetails>? mainResponse;
      HttpRequestHandler requestHandler = HttpRequestHandler();

      var isSuccess = await requestHandler.sendTokenServerRequest(
          HttpConstants.baseUrl, data);

      if (isSuccess) {
        List resBody = requestHandler.responsebody;

        mainResponse =
            resBody.map((game) => GameDetails.fromJson(game)).toList();
      }
      return mainResponse;
    } catch (e) {
      throw e;
    }
  }
}
