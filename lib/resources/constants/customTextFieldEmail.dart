import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Colors/colors.dart';


class CustomTextFieldEmail extends StatelessWidget {
  const CustomTextFieldEmail({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: TextFormField(
        style: TextStyle(color: AppColor.blackColor),
        controller: controller,
        textCapitalization: TextCapitalization.words,
        decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.blackColor),
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
