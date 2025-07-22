// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smart_tailor/resources/routes/routes_name.dart';
//
// class ChooseLanguageScreen extends StatefulWidget {
//   const ChooseLanguageScreen({super.key});
//
//   @override
//   State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
// }
//
// class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
//   String? selectedLanguage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Language'.tr),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         automaticallyImplyLeading: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 40),
//           ListTile(
//             title: Text("English".tr),
//             leading: Radio<String>(
//               value: "English",
//               groupValue: selectedLanguage,
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value;
//                   Get.updateLocale(const Locale('en', 'US'));
//                 });
//               },
//             ),
//           ),
//           ListTile(
//             title: Text("Urdu".tr),
//             leading: Radio<String>(
//               value: "Urdu",
//               groupValue: selectedLanguage,
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value;
//                   Get.updateLocale(const Locale('ur', 'PK'));
//                 });
//               },
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton(
//               onPressed: selectedLanguage != null
//                   ? () {
//                 Get.toNamed(RoutesName.loginScreen);
//                 print("Selected: $selectedLanguage");
//               }
//                   : null,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 minimumSize: const Size.fromHeight(50),
//               ),
//               child: Text("Get Started".tr),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_tailor/resources/routes/routes_name.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String? selectedLanguage;

  Future<void> _onLanguageSelected(String langCode, Locale locale) async {
    setState(() => selectedLanguage = langCode);
    Get.updateLocale(locale);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('language_selected', true); // ✅ Save flag
    await prefs.setString('selected_lang', langCode); // Optional: Save lang

    Get.offAllNamed(RoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Language'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ListTile(
            title: Text("English".tr),
            leading: Radio<String>(
              value: "English",
              groupValue: selectedLanguage,
              onChanged: (_) => _onLanguageSelected("English", const Locale('en', 'US')),
            ),
          ),
          ListTile(
            title: Text("Urdu".tr),
            leading: Radio<String>(
              value: "Urdu",
              groupValue: selectedLanguage,
              onChanged: (_) => _onLanguageSelected("Urdu", const Locale('ur', 'PK')),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: selectedLanguage != null ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text("Get Started".tr),
            ),
          ),
        ],
      ),
    );
  }
}
