import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:armino_game/Utils/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:decorated_icon/decorated_icon.dart';

Widget button({
  required double width,
  required double height,
  required Function() onTap,
  required String label,
  Color labelColor = AppColorCode.pureWhite,
  Color buttonColor = AppColorCode.brandColor,
  Icon? icondata,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              label,
              style: AppFontMain(
                color: labelColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (icondata != null) icondata,
        ],
      ),
    ),
  );
}

Widget buildtextForm(
    {String? label,
    String? hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    int minLines = 1,
    int maxLines = 1,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label != null
          ? Text(
              label,
              style: AppFontMain(
                color: AppColorCode.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          : SizedBox(height: 10),
      SizedBox(height: 10),
      Container(
        // height: 55,
        child: TextFormField(
          onTap: onTap,
          controller: controller,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: AppColorCode.primaryText,
          style: AppFontMain(
            color: AppColorCode.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 0),
            suffixIcon: suffixIcon,
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColorCode.border),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                color: AppColorCode.border,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildtextFormLogin({
  String? label,
  String? hintText,
  bool obscureText = false,
  Widget? suffixIcon,
  TextInputType keyboardType = TextInputType.text,
  int minLines = 1,
  int maxLines = 1,
  TextEditingController? controller,
  String? Function(String?)? validator,
  Widget? coutomIcon,
}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10.h,
          width: 20.w,
          child: coutomIcon,
          decoration: BoxDecoration(
            color: AppColorCode.pureWhite,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          width: 32.h,
          //  height: 14.w,
          child: TextFormField(
            controller: controller,
            validator: validator,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: AppColorCode.primaryText,
            style: AppFontMain(
              color: AppColorCode.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.fromLTRB(18, 10, 10, 12),
              suffixIcon: suffixIcon,
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: AppColorCode.border),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: AppColorCode.border,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomCeckBox extends StatefulWidget {
  CustomCeckBox(this.onChange, this.text);
  final Function onChange;
  final String text;
  @override
  _CustomCeckBoxState createState() => _CustomCeckBoxState();
}

class _CustomCeckBoxState extends State<CustomCeckBox> {
  bool _value = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.onChange(!_value);
          _value = !_value;
        })
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _value
                    ? Icon(
                        Icons.check_box,
                        color: AppColorCode.brandColor,
                        size: 20,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        color: AppColorCode.brandColor,
                        size: 20,
                      ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.text,
              style: AppFontMain(
                color: AppColorCode.whiteshadow,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget backButtonCherv(BuildContext context) => InkWell(
      onTap: () => Get.back(),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: const Center(
                child: Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            height: MediaQuery.of(context).size.height * .055,
            width: MediaQuery.of(context).size.width * .11,
          )),
    );
Widget appBar({String? label}) {
  return Column(
    children: [
      Container(
        color: AppColorCode.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 13.h,
                    width: 15.w,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new ExactAssetImage(AssetConstant.person),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        color: AppColorCode.primaryText,
                        border: Border.all(color: AppColorCode.brandColor)),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  label!,
                  style: AppFontMain(
                    color: AppColorCode.grey2,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                DecoratedIcon(
                  Icons.search,
                  color: AppColorCode.brandColor,
                  size: 40,
                  shadows: [
                    BoxShadow(
                      blurRadius: 12.0,
                      color: AppColorCode.brandColor,
                    ),
                    BoxShadow(
                      blurRadius: 52.0,
                      color: AppColorCode.brandColor,
                      offset: Offset(0, 3.0),
                      spreadRadius: 10.0,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Stack(
                  children: [
                    DecoratedIcon(
                      Icons.notifications_none_rounded,
                      color: AppColorCode.brandColor,
                      size: 40,
                      shadows: [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: AppColorCode.brandColor,
                        ),
                        BoxShadow(
                          blurRadius: 52.0,
                          color: AppColorCode.brandColor,
                          offset: Offset(0, 3.0),
                          spreadRadius: 10.0,
                        ),
                      ],
                    ),
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle_rounded,
                        color: AppColorCode.orangeCardColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Divider()
    ],
  );
}
