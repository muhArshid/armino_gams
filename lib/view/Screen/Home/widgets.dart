import 'package:armino_game/Service/network/HttpConstants.dart';
import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:armino_game/Utils/helper/date_format_helper.dart';
import 'package:armino_game/controller/game_controller.dart';
import 'package:armino_game/model/core/games_modal_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

Widget choosButton(GetGames data) {
  GameCtr gameCtr = Get.find();
  return InkWell(
    onTap: () {
      String id = data.id.toString();
      var dat = "fields *; where id = $id;";

      gameCtr.gamedetils(dat);
    },
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              color: AppColorCode.cardBackgroundColor,
              borderRadius: BorderRadius.circular(29)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                data.name!,
                style: AppFontMain(
                  color: AppColorCode.labelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        )),
  );
}

class PopularItem extends StatefulWidget {
  PopularItem({Key? key, this.data}) : super(key: key);
  final GameDetails? data;
  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  GameCtr gameCtr = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: AppColorCode.subHeaderColor,
            borderRadius: BorderRadius.circular(22)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              height: 18.h,
              width: 70.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          HttpConstants.imageUrl + widget.data!.cover!.url!)),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        AppColorCode.gray1,
                        AppColorCode.gradient2
                      ]),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
            ),
            Positioned(
              top: 130,
              right: 20,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.data!.fav = !widget.data!.fav!;
                  });
                  gameCtr.addfavourite(widget.data!, !widget.data!.fav!);
                },
                child: Icon(
                    widget.data!.fav!
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColorCode.brandColor),
              ),
            ),
            Positioned(
              top: 130,
              left: 20,
              child: Text(
                widget.data!.name!,
                style: AppFontMain(
                  color: AppColorCode.labelColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Positioned(
              top: 60,
              right: 20,
              child: Icon(Icons.arrow_forward_ios),
            ),
            const Positioned(
              top: 60,
              left: 20,
              child: Icon(Icons.arrow_back_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetils extends StatefulWidget {
  ItemDetils({Key? key, this.data}) : super(key: key);
  final GameDetails? data;
  @override
  State<ItemDetils> createState() => _ItemDetilsState();
}

class _ItemDetilsState extends State<ItemDetils> {
  GameCtr gameCtr = Get.find();
  final List<String> downloadList = <String>[
    AssetConstant.android,
    AssetConstant.ios,
    AssetConstant.cib,
    AssetConstant.playstation,
    AssetConstant.steam,
    AssetConstant.smwitch,
  ];
  @override
  Widget build(BuildContext context) {
    String date =
        DateFormatHelper.datemounthYear(widget.data!.firstReleaseDate!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: AppColorCode.cardBackgroundColor,
            borderRadius: BorderRadius.circular(22)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              height: 26.h,
              width: 90.w,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      HttpConstants.imageUrl + widget.data!.cover!.url!)),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: const Radius.circular(22))),
            ),
            Positioned(
              top: 180,
              right: 20,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.data!.fav = !widget.data!.fav!;
                  });
                  gameCtr.addfavourite(widget.data!, !widget.data!.fav!);
                },
                child: Icon(
                    widget.data!.fav!
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColorCode.brandColor),
              ),
            ),
            Positioned(
              top: 190,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.data!.name!,
                        style: AppFontMain(
                          color: AppColorCode.labelColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      textBox(
                          SvgPicture.asset(
                            AssetConstant.calender,
                            color: AppColorCode.brandColor,
                            height: 20.0,
                            width: 20.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                          date.toString()),
                      textBox(
                          SvgPicture.asset(AssetConstant.addve,
                              height: 20.0,
                              width: 20.0,
                              semanticsLabel: 'Acme Logo'),
                          'Action'),

                      textBox(
                          SvgPicture.asset(AssetConstant.addve,
                              height: 20.0,
                              width: 20.0,
                              semanticsLabel: 'Acme Logo'),
                          'Adventure'),
                      //   textBox(AssetConstant.addve, 'Action'),
                      //    textBox(AssetConstant.addve, 'Adventure')
                    ],
                  ),
                  SizedBox(height: 1.h),
                  //  textBox(AssetConstant.addve, '30% OFF'),
                  textBox(
                      SvgPicture.asset(AssetConstant.offer,
                          height: 20.0,
                          width: 20.0,
                          semanticsLabel: 'Acme Logo'),
                      '30% OFF'),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Text(
                        'Download',
                        style: AppFontMain(
                          color: AppColorCode.labelColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Container(
                            height: 5.h,
                            width: 60.w,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: downloadList.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        download(downloadList[index])),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget download(String text) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        text,
        height: 20.0,
        width: 20.0,
        allowDrawingOutsideViewBox: true,
      ),
    ),
  );
}

Widget choosMainButton(ChooseList data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColorCode.brandColor),
          color: AppColorCode.subHeaderColor,
          borderRadius: BorderRadius.circular(29)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                data.image!,
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              SizedBox(width: 1.w),
              Text(
                data.name!,
                style: AppFontMain(
                  color: AppColorCode.labelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget textBox(Widget icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: Container(
      decoration: BoxDecoration(
          color: AppColorCode.subHeaderColor,
          borderRadius: BorderRadius.circular(29)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              SizedBox(width: 2.w),
              Text(
                text,
                style: AppFontMain(
                  color: AppColorCode.labelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
