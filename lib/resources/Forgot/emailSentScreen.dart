
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_tailor/resources/routes/routes_name.dart';

class EmailSentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments ?? '';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mark_email_read_rounded, size: 120, color: Colors.blueAccent),
            const SizedBox(height: 30),

            Text(
              "Email Sent!",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Text(
              "We’ve sent a password reset link to your email address:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              email,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              "If you don't see the email, please check your Spam or Junk folder.",
              style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              icon: const Icon(Icons.lock_open_rounded,color: Colors.white,),
              label: const Text("I’ve reset my password",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Get.toNamed(RoutesName.resetSuccessScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
