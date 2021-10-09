import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testskill/screen/customerList/customerList.dart';
import 'package:testskill/screen/profile/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'หน้าหลัก',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 10.h,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'เมนูหลัก',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  buttonDashboard(
                    text: 'โปรไฟล์',
                    press: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const Profile(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  buttonDashboard(
                    text: 'รายชื่อลูกค้า',
                    press: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const CustomerList(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonDashboard extends StatelessWidget {
  final text;
  final press;
  const buttonDashboard({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: FlatButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
