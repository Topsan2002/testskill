import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:testskill/api/api.dart';
import 'package:testskill/components/master/alertdialog.dart';
import 'package:testskill/screen/customerList/customerList.dart';

class EditCustomer {
  Future sendDataEdit(BuildContext context, dynamic data) async {
    Api api = Api();
    var url = Uri.parse('${api.path}customer/edit_customer.php');
    var response = await http.post(
      url,
      body: data,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      },
    );
    var res = jsonDecode(response.body);
    if (res['status'] == true) {
      showDialog(
        context: context,
        builder: (context) => const alertDialogSuccess(
          text: 'แก้ไขข้อมูลสำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 100), () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const CustomerList(),
            type: PageTransitionType.fade,
          ),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const alertDialogSuccess(
          text: 'แก้ไขข้อมูลไม่สำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 100), () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const CustomerList(),
            type: PageTransitionType.fade,
          ),
        );
      });
    }
  }

  Future editCustomer(
    BuildContext context,
    dynamic id,
    String fname,
    String lname,
    String phone,
  ) async {
    final _keyform = GlobalKey<FormBuilderState>();
    var data = fname;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 200.h,
          width: 200.w,
          child: Column(
            children: [
              Center(
                child: Text(
                  'แก้ไขข้อมูล',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FormBuilder(
                key: _keyform,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    formEditcustomer(
                      name: 'fname',
                      text: '${fname}',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    formEditcustomer(
                      name: 'lname',
                      text: '${lname}',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    formEditcustomer(
                      name: 'phone',
                      text: '${phone}',
                    ),
                  ],
                ),
              )
            ],
          ),
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
              'ตกลง',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            onPressed: () {
              var key = _keyform.currentState;
              key?.save();
              if (key?.value['fname'] == null || key?.value['fname'] == "") {
                key?.setInternalFieldValue('fname', fname);
              }
              if (key?.value['lname'] == null || key?.value['lname'] == "") {
                key?.setInternalFieldValue('lname', lname);
              }
              if (key?.value['phone'] == null || key?.value['phone'] == "") {
                key?.setInternalFieldValue('phone', phone);
              }
              key?.setInternalFieldValue('id', id);
              sendDataEdit(context, key?.value);
            },
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 5.h,
            ),
            color: Colors.red,
            textColor: Colors.white,
            child: Text('ยกเลิก',
                style: TextStyle(
                  fontSize: 12.sp,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class formEditcustomer extends StatelessWidget {
  final name;
  final String text;

  const formEditcustomer({
    Key? key,
    required this.name,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      style: TextStyle(
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 7.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: HexColor(
              "E5E5E5",
            ),
            width: 2.h,
          ),
        ),
      ),
    );
  }
}
