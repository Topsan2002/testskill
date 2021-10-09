import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testskill/components/alert/cus_del.dart';
import 'package:testskill/components/alert/cus_edit.dart';
import 'package:testskill/components/master/dowload.dart';
import 'package:testskill/mapData/customerdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bodyCustomerList extends StatelessWidget {
  final future;
  EditCustomer editCustomer = EditCustomer();
  DeleteCustomer deleteCustomer = DeleteCustomer();
  bodyCustomerList({
    Key? key,
    this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext builcontext, AsyncSnapshot snapshot) {
        if (snapshot.data == 0) {
          return Center(
            child: Text(
              'ไม่พบรายชื่อลูกค้า',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          List<DataCustomer> data =
              dataCustomerFromJson(jsonEncode(snapshot.data));
          return Column(
            children: data
                .map((e) => Column(
                      children: [
                        Row(
                          children: [
                            cellTable(
                              flex: 3,
                              text: '${e.fname}  ${e.lname}',
                              textAlign: TextAlign.left,
                            ),
                            cellTable(
                              flex: 2,
                              text: '${e.phone}',
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {
                                        editCustomer.editCustomer(context,
                                            e.cusId, e.fname, e.lname, e.phone);
                                      },
                                      child: Image.asset(
                                        'assets/icon/edit.png',
                                        height: 25.h,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {
                                        deleteCustomer.deleteCus(
                                          context,
                                          e.cusId,
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/icon/delete.png',
                                        height: 25.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      ],
                    ))
                .toList(),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            child: const dowlondWidget(),
          );
        }
      },
    );
  }
}

class hederTable extends StatelessWidget {
  const hederTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        cellTable(
          flex: 3,
          text: 'ชื่อ-นามสกุล',
          textAlign: TextAlign.center,
        ),
        cellTable(
          flex: 3,
          text: 'เบอร์โทร',
          textAlign: TextAlign.center,
        ),
        cellTable(
          flex: 3,
          text: 'จัดการ',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class cellTable extends StatelessWidget {
  final flex;
  final String text;
  final textAlign;
  const cellTable({
    Key? key,
    required this.flex,
    required this.text,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
