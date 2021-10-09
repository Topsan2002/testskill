import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testskill/api/api.dart';
import 'package:testskill/components/master/alertdialog.dart';
import 'package:http/http.dart' as http;
import 'package:testskill/screen/customerList/customerList.dart';

class DeleteCustomer {
  Future sendDelete(BuildContext context, dynamic data) async {
    Api api = Api();
    var url = Uri.parse('${api.path}customer/del_customer.php');
    var response = await http.post(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      },
    );
    var res = jsonDecode(response.body);
    if (res['status'] == true) {
      showDialog(
        context: context,
        builder: (context) => const alertDialogSuccess(
          text: 'ลบข้อมูลลูกค้าสำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 1000), () {
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
        builder: (context) => const alertDialogFail(
          text: 'ลบข้อมูลลูกค้าไม่สำเร็จ',
        ),
      );
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    }
  }

  Future deleteCus(BuildContext context, dynamic id) async {
    showDialog(
      context: context,
      builder: (context) => confiemDialog(
        text: 'คุณต้องการที่จะลบชื่อลูกค้าใช่หรือไม่',
        press: () {
          sendDelete(context, {'id': id});
        },
      ),
    );
  }
}
