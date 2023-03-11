import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_otp/phone_auth/otp_verfiy.dart';
//import 'package:firebase_otp/phone_auth/otp_verfiy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController numController = TextEditingController();

  void sendOTP() async {
    String phone = "+91" + numController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => OtpPage(verificationId: verificationId),
            ),
          );
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          //log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          ElevatedButton(onPressed: () {}, child: Text("Send OTP"))
        ],
      ),
    );
  }
}
