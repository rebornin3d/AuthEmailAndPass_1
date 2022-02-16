import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email_and_password/src/screens/login.dart';
import 'package:flutter/material.dart';

import 'google_maps.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
            ElevatedButton(
              child: const Text('GoogleMaps'),
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const GoogleMaps()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
