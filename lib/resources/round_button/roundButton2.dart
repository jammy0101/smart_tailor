// import 'package:flutter/material.dart';
// import '../Colors/colors.dart';
//
// class RoundButton2 extends StatelessWidget {
//   const RoundButton2({
//     super.key,
//     this.loading = false,
//     required this.title,
//     required this.onPress,
//     this.width = 60,
//     this.height = 50,
//     required this.textColor ,
//     required this.buttonColor2,
//     //this.child,
//   });
//
//   final bool loading;
//   final String title;
//   final VoidCallback onPress;
//   final double height, width;
//   final Color textColor, buttonColor2;
//   //final Widget? child; // Custom child widget for more flexibility
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             color: buttonColor2,
//             borderRadius: BorderRadius.circular(13),
//           ),
//           child: loading
//               ? const Center(
//               child: CircularProgressIndicator()) : Center(
//             child: Text(
//               title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.whiteColor,fontWeight: FontWeight.bold),),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton2 extends StatelessWidget {
  final double width;
  final double height;
  final bool loading;
  final String? title;
  final VoidCallback onPress;
  final Color textColor;
  final Color buttonColor2;
  final Widget? child;

  const RoundButton2({
    Key? key,
    required this.width,
    required this.height,
    required this.loading,
    this.title,
    required this.onPress,
    required this.textColor,
    required this.buttonColor2,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor2,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade400, // or any accent color
            width: 2,
          ),
        ),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
          child: child ??
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}
