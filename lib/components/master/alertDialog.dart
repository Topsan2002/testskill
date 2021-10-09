import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class alertDialogSuccess extends StatelessWidget {
  final text;
  const alertDialogSuccess({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150.h,
        width: 200.h,
        child: Column(
          children: [
            Image.asset(
              'assets/icon/ok.png',
              height: 100.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class alertDialogFail extends StatelessWidget {
  final text;
  const alertDialogFail({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150.h,
        width: 200.h,
        child: Column(
          children: [
            Image.asset(
              'assets/icon/close.png',
              height: 100.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class confiemDialog extends StatelessWidget {
  final String text;
  final press;
  const confiemDialog({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(text)),
      titleTextStyle: TextStyle(
        fontFamily: 'kanit',
        fontSize: 16.sp,
        color: Colors.black,
      ),
      actions: <Widget>[
        FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 5.h,
          ),
          color: HexColor("#1DAE46"),
          textColor: Colors.white,
          child: Text(
            'ใช่',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          onPressed: press,
        ),
        FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 5.h,
          ),
          color: Colors.red,
          textColor: Colors.white,
          child: Text('ไม่ใช่',
              style: TextStyle(
                fontSize: 12.sp,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
