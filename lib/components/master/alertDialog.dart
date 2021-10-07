import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
