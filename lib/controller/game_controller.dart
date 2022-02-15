import 'dart:convert';
import 'dart:io';

import 'package:armino_game/Service/api/main_api.dart';
import 'package:armino_game/model/core/games_modal_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameCtr extends GetxController {
  List<GetGames>? games;
  int chooseId = 0;
  bool isFist = true;
  changeIsFetchingValue(bool flag) {
    isFist = flag;
    update();
  }

  gameName() async {
    try {
      games = await GeneralAPI.getGames("fields name; limit 10;");
      update();
    } finally {
      //  changeIsFetchingValue(false);
    }
  }

  List<GameDetails>? gameDetils;

  gamedetils(dynamic data) async {
    try {
      gameDetils = await GeneralAPI.getGameDetails(data);
      update();
    } finally {
      //  changeIsFetchingValue(false);
    }
  }

  List<GameDetails>? populargameDetils;

  popularGamedetils(dynamic data) async {
    try {
      populargameDetils = await GeneralAPI.getGameDetails(data);
      update();
    } finally {
      changeIsFetchingValue(false);
    }
  }

  RxList<GameDetails> myFavList = <GameDetails>[].obs;
  addfavourite(GameDetails getList, bool fav) {
    getList.fav == fav;
    if (fav) {
      myFavList.remove(getList);

      update();
    } else {
      myFavList.add(getList);

      update();
    }
    update();
  }
}
