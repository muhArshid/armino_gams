import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorDialog(String mssg) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'OOPS..',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                mssg,
                style: TextStyle(fontSize: 14, color: Colors.grey),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColorCode.brandColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'OKAY',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
successDialog(String msg, Function() ontap) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
            ),
            Container(
              child: Text(
                msg,
                style: TextStyle(fontSize: 14, color: AppColorCode.primaryText),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: ontap,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColorCode.brandColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'OKAY',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
