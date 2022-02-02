import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email_and_password/src/screens/home.dart';
import 'package:firebase_auth_email_and_password/src/screens/reset.dart';
import 'package:firebase_auth_email_and_password/src/screens/verify.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;

  var builder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Text('Signin')),
              ElevatedButton(
                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(
                            email: _email, password: _password)
                        .then((_) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const VerifyScreen()));
                    });
                  },
                  child: const Text('Signup')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const ResetScreen())),
                child: const Text('Forgot Password'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
