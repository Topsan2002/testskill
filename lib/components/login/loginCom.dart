import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class textInputLogin extends StatelessWidget {
  final name;
  final obscureText;
  final hintText;

  const textInputLogin({
    Key? key,
    required this.name,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      style: TextStyle(
        fontSize: 16.sp,
      ),
      obscureText: obscureText,
      validator: FormBuilderValidators.compose([
        (val) {
          if (val == "" || val == null) {
            return "กรุณากรอกข้อมูลให้ครบถ้วน";
          } else {
            return null;
          }
        }
      ]),
      decoration: InputDecoration(
        hintText: hintText,
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

class loginButton extends StatelessWidget {
  final String text;
  final press;
  const loginButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: FlatButton(
        onPressed: press,
        padding: const EdgeInsets.all(0),
        child: Text(text,
            style: TextStyle(
              fontSize: 16.h,
              color: Colors.white,
            )),
      ),
    );
  }
}
