import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testskill/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:testskill/components/login/login_com.dart';
import 'package:testskill/components/master/alertdialog.dart';
import 'package:testskill/components/master/dowload.dart';
import 'package:testskill/screen/dashboard/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _keyform = GlobalKey<FormBuilderState>();
  Api api = new Api();

  void login() async {
    var url = Uri.parse('${api.path}user/login.php');
    _keyform.currentState?.save();

    var response = await http.post(
      url,
      body: _keyform.currentState?.value,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
    );

    var res = jsonDecode(response.body);
    if (res['status'] == true) {
      SharedPreferences keep = await SharedPreferences.getInstance();
      keep.setString('user_data', jsonEncode(res['data']));

      showDialog(
        context: context,
        builder: (context) => const alertDialogSuccess(
          text: 'ลงชื่อเข้าใช้สำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const Dashboard(), type: PageTransitionType.fade));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const alertDialogFail(
          text: 'ลงชื่อเข้าใช้ไม่สำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'ลงชื่อเข้าใช้งาน',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/icon/profile.png',
                    height: 100.h,
                  ),
                  SizedBox(height: 20.h),
                  FormBuilder(
                    key: _keyform,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: EdgeInsets.all(20.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ignore: prefer_const_constructors
                          textInputLogin(
                            name: 'username',
                            obscureText: false,
                            hintText: 'ชื่อผู้ใช้งาน',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // ignore: prefer_const_constructors
                          textInputLogin(
                            name: 'password',
                            obscureText: true,
                            hintText: 'รหัสผ่าน',
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'ลืมรหัสผ่าน',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: HexColor("#9F9F9F"),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: loginButton(
                              text: 'ลงชื่อเข้าใช้',
                              press: () {
                                if (_keyform.currentState!.validate()) {
                                  login();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
