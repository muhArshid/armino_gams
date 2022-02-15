import 'dart:convert';
import 'dart:io';

import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:armino_game/Widget/button_icons_widgets.dart';
import 'package:armino_game/controller/game_controller.dart';
import 'package:armino_game/model/core/games_modal_res.dart';
import 'package:armino_game/view/Screen/Home/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ChooseList> mainChooseList = [
    ChooseList(id: 1, name: 'All', image: AssetConstant.addve),
    ChooseList(id: 1, name: 'Action', image: AssetConstant.addve),
    ChooseList(id: 1, name: 'Adventure', image: AssetConstant.addve),
    ChooseList(id: 1, name: 'Puzzle', image: AssetConstant.puzzle)
  ];
  GameCtr gameCtP = Get.put(GameCtr());
  GameCtr gameCtr = Get.find();
  late List<GetGames> list;
  bool isLoaded = true;
  String data =
      "fields name,cover.*, first_release_date, rating; where cover != null & first_release_date != n & rating != n; limit 50; sort rating desc;";
  String popData =
      "fields name,cover.*, first_release_date, rating; where cover != null; limit 10; sort rating desc;";
  @override
  void initState() {
    if (gameCtr.isFist) {
      apiCallGames();
      apicallgameDetils();
      apicallPopularGames();
    }

    super.initState();
  }

  void apiCallGames() async {
    await gameCtr.gameName();
    if (mounted) {
      isLoaded = false;
    }
  }

  void apicallPopularGames() async {
    await gameCtr.popularGamedetils(popData);
    if (mounted) {
      isLoaded = false;
    }
  }

  void apicallgameDetils() async {
    await gameCtr.gamedetils(data);
    if (mounted) {
      // isLoaded = false;
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<GameCtr>(builder: (ct) {
      return Scaffold(
        backgroundColor: AppColorCode.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top: size.height * 0.10,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(physics: BouncingScrollPhysics(), children: [
                  SizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Popular',
                      style: AppFontMain(
                        color: AppColorCode.brandColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  if (ct.populargameDetils != null)
                    Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                            height: 25.h,
                            // width: 20.w * ct.populargameDetils!.length,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: ct.populargameDetils!.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    PopularItem(
                                        data: ct.populargameDetils![index])))),
                  SizedBox(height: 5.h),
                  if (ct.games != null)
                    Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Container(
                          height: 5.h,
                          width: 20.w,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ct.games!.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  return InkWell(
                                    onTap: () {
                                      apicallgameDetils();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ct.chooseId == 0
                                                  ? AppColorCode.brandColor
                                                  : AppColorCode
                                                      .cardBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(29)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Center(
                                              child: Text(
                                                'All',
                                                style: AppFontMain(
                                                  color:
                                                      AppColorCode.labelColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  );
                                }
                                return choosButton(ct.games![index]);
                              }),
                        )),
                  SizedBox(height: 3.h),
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mainChooseList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                choosMainButton(mainChooseList[index])),
                      )),
                  SizedBox(height: 3.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Today',
                      style: AppFontMain(
                        color: AppColorCode.brandColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (ct.gameDetils != null)
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                            height: 50.h * ct.gameDetils!.length,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: ct.gameDetils!.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    ItemDetils(data: ct.gameDetils![index])))),
                  SizedBox(height: 20.h),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(child: CircularProgressIndicator()))
                ])),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: appBar(
                label: 'John',
              ),
            ),
          ],
        ),
      );
    });
  }
}
