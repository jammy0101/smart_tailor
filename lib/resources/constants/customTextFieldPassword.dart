//
// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   final String? Function(String?)? validator;
//
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.suffixIcon,
//     this.validator,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 3),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         textCapitalization: TextCapitalization.words,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.black),
//           suffixIcon: suffixIcon,
//           border: OutlineInputBorder(),
//           //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//          // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // vertical spacing
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(

          ),
        ),
        validator: validator,
      ),
    );
  }
}
