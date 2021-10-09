import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testskill/mapData/userdata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future profileData() async {
    SharedPreferences keep = await SharedPreferences.getInstance();
    var data = keep.getString('user_data');
    return data == "" || data == null ? 0 : data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ข้อมูลผู้ใช้งาน',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(
              10.h,
            ),
            child: Container(
              padding: EdgeInsets.all(
                10.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      'ข้อมูลผู้ใช้งาน',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: profileData(),
                    builder:
                        (BuildContext buildcontext, AsyncSnapshot snapshot) {
                      if (snapshot.data == 0) {
                        return Text(
                          'ไม่พบข้อมูลผู้ใช้',
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<DataUser> data = dataUserFromJson(snapshot.data);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: data
                              .map(
                                (e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    rowData(
                                      title1: 'ชื่อ : ',
                                      data1: '${e.fname}',
                                      title2: 'นามสกุล : ',
                                      data2: '${e.lname}',
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('ที่อยู่ : ',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                      e.address,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('เบอร์โทร : ',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                      e.phone,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('Email : ',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                      e.email,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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

class rowData extends StatelessWidget {
  final title1;
  final data1;
  final title2;
  final data2;
  const rowData({
    Key? key,
    required this.title1,
    required this.data1,
    required this.title2,
    required this.data2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: textData(
            title: title1,
            data: data1,
          ),
        ),
        Expanded(
          child: textData(
            title: title2,
            data: data2,
          ),
        ),
      ],
    );
  }
}

class textData extends StatelessWidget {
  final title;
  final data;
  const textData({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
        ),
        children: [
          TextSpan(
            text: title,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: data,
          ),
        ],
      ),
    );
  }
}
