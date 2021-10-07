import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testskill/screen/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Test App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'kanit',
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'kanit',
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: HexColor("#EDEDED"),
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }
}
