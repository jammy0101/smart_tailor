import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../viewModal/firebase_services/firebase_services.dart';
import '../Colors/colors.dart';
import '../routes/routes_name.dart';
import '../utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  final FirebaseAuth auth;

  CustomDrawer({super.key, required this.auth});

  FirebaseServices firebaseServices = Get.find<FirebaseServices>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.blueColor),
            child: const Center(
              child: FittedBox(
                child: Text(
                  'YOUTUBE CHANNEL PROMOTION',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.black),
            title: const Text(
              'Delete Account',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            onTap: () => _showDeleteAccountDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
            title: const Text(
              'Log Out',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            onTap: () => _signOut(),
          ),
        ],
      ),
    );
  }

  void _signOut() async {
    try {
      await auth.signOut();
      Utils.toastMessage('Signed out successfully');
      // final FirebaseServices firebaseServices = Get.find();
      //controller.loading.value = false; // Reset loading to avoid stuck loader
      Get.offAllNamed(RoutesName.loginScreen);
    } catch (e) {
      Utils.toastMessage('Error signing out: ${e.toString()}');
    }
  }


  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _deleteAccount(); // Call the delete account function
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    try {
      await auth.currentUser?.delete();
      Utils.toastMessage('Account deleted successfully');
      Get.offAllNamed(RoutesName.loginScreen); // Navigate to sign-in screen
    } catch (e) {
      Utils.toastMessage('Error deleting account: ${e.toString()}');
    }
  }

}
