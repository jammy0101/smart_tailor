import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final FirebaseAuth auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {

  final Map<String, String> measurements = {
    "Length": "",
    "Sleeve": "",
    "Shoulder": "",
    "Neck": "",
    "Chest": "",
    "Waist": "",
    "Hip": "",
    "Bottom": "",
    "Shalwaar": "",
    "Leg Open": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          TextButton(
            onPressed: ()async{
              await auth.signOut();
              Get.offAllNamed(RoutesName.loginScreen);
            },
            child: Icon(Icons.logout,size: 30,),
          )
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

