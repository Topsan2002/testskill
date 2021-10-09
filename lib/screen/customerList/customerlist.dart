// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testskill/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:testskill/components/alert/cus_del.dart';
import 'package:testskill/components/alert/cus_edit.dart';
import 'package:testskill/components/customer/cus_com.dart';
import 'package:testskill/components/master/dowload.dart';
import 'package:testskill/mapData/customerdata.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  Api api = new Api();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcustomer();
  }

  Future getcustomer() async {
    var url = Uri.parse('${api.path}customer/customerdata.php');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    });
    var res = jsonDecode(response.body);
    if (res['status'] == true) {
      return res['data'];
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายชื่อลูกค้า'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'รายชื่อลูกค้า',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const hederTable(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  bodyCustomerList(
                    future: getcustomer(),
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
