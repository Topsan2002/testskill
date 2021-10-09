import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dowlondWidget extends StatelessWidget {
  const dowlondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            width: 50.h,
            child: CircularProgressIndicator(
              strokeWidth: 3.sp,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              'กำลังโหลดข้อมูล...',
              style: TextStyle(
                fontSize: 14.h,
                // color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
