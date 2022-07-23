// ignore_for_file: file_names, camel_case_types, unused_field

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class register_Screen extends StatefulWidget {
  const register_Screen({Key? key}) : super(key: key);

  @override
  State<register_Screen> createState() => _register_ScreenState();
}

class _register_ScreenState extends State<register_Screen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {
     await auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      timeout: Duration(seconds: 180),
      verificationCompleted: (AuthCredential credential) {
        print(credential);
        auth.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken ) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
     );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
          RaisedButton(
            child: Text('Verify'),
            onPressed: () {
              verifyPhone();
            },
          ),
          TextField(
            controller: _otpController,
            decoration: InputDecoration(
              labelText: 'OTP',
            ),
          ),
          RaisedButton(
            child: Text('Sign In'),
            onPressed: () {
              auth.signInWithCredential(
                PhoneAuthProvider.credential(
                  verificationId: '',
                  smsCode: _otpController.text,
                ),
              
              
              );
            },
          ),
        ],
      ),
    
    );
  }
}
