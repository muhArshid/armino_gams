import 'package:armino_game/Utils/asset_constants.dart';
import 'package:armino_game/controller/main_condroller.dart';
import 'package:armino_game/notech_Screen/show_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:armino_game/Utils/AppColorCode.dart';
import 'package:armino_game/Utils/AppFontOswald.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  MainController putCtr = Get.put(MainController());
  TextEditingController phoneCt = TextEditingController();
  TextEditingController emailCt = TextEditingController();
  TextEditingController addCt = TextEditingController();
  bool passwordVisible = false;
  bool verifyPasswordVisible = false;

  saveApi() {
    var list = MemberLogin(
        email: emailCt.text, phone: phoneCt.text, addres: addCt.text);
    putCtr.addLogin(list);
  }

  clearText() {
    emailCt.text = '';
    phoneCt.text = '';

    addCt.text = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Stack(children: [
          Positioned(
              top: size.height * 0.10,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(children: [
                SizedBox(height: 5.h),
                Center(
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 25.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              image: DecorationImage(
                                  image: AssetImage(AssetConstant.person),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 0,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(58.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColorCode.black),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColorCode.pureWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    'Razi',
                    style: AppFontMain(
                      color: AppColorCode.pureWhite,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColorCode.pureWhite,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                            key: _formKey,
                            child: Column(children: [
                              SizedBox(height: 5.h),
                              buildtextForm(
                                label: 'Email',
                                controller: emailCt,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter Email ID';
                                  }
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)) {
                                    return 'Enter a Valid Email';
                                  }
                                  return null;
                                },
                              ),
                              buildtextForm(
                                  label: 'Mobile Number',
                                  controller: phoneCt,
                                  validator: (val) {}),
                              buildtextForm(
                                  maxLines: 4,
                                  label: ' Address',
                                  controller: addCt,
                                  validator: (val) {}),
                              SizedBox(height: 2.h),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      saveApi();
                                      clearText();
                                    }
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: AppFontMain(
                                          color: AppColorCode.pureWhite,
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]))))
              ])),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: appBar(
              label: 'Edit ',
            ),
          ),
        ]));
  }
}

Widget buildtextForm({
  String? label,
  String? hintText,
  bool obscureText = false,
  Widget? suffixIcon,
  TextInputType keyboardType = TextInputType.text,
  int minLines = 1,
  int maxLines = 1,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label != null
          ? Text(
              label,
              style: AppFontMain(
                color: AppColorCode.primaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          : SizedBox(height: 10),
      SizedBox(height: 10),
      Container(
        // height: 55,
        child: TextFormField(
          controller: controller,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: AppColorCode.mainDark,
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
              borderSide: BorderSide(color: AppColorCode.border),
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

Widget appBar({String? label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => ShowScreen());
              },
              child: Icon(
                Icons.line_weight_sharp,
                color: AppColorCode.gray,
              ),
            ),
            SizedBox(
              width: 10,
            ),
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
        Icon(Icons.edit, color: AppColorCode.pureWhite),
      ],
    ),
  );
}

class MemberLogin {
  String? email;
  String? phone;
  String? addres;

  MemberLogin({this.email, this.phone, this.addres});

  MemberLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    addres = json['addres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['addres'] = this.addres;
    return data;
  }
}
