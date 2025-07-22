import 'package:flutter/material.dart';
import '../Colors/colors.dart';

class CustomTextFieldName extends StatelessWidget {
  const CustomTextFieldName({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: AppColor.blackColor),
        textCapitalization: TextCapitalization.words, // Name case
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.blackColor),
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 3)
          ),
        ),
        validator: validator,
      ),
    );
  }
}
