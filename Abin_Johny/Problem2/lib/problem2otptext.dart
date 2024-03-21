import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:problem2/problem2profile.dart';

class OtpText extends StatefulWidget {
  const OtpText({Key? key}) : super(key: key);

  @override
  State<OtpText> createState() => _OtpTextState();
}

class _OtpTextState extends State<OtpText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 260,
            ),
            const Text(
              "Verification Code",
              style: TextStyle(fontSize: 40),
            ),
            const Text('we have send the verification '
                'code to your Email'),
            const SizedBox(
              height: 40,
            ),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                debugPrint('Completed:   $pin');
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyProfile()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                minimumSize: const Size(380, 50),
              ),
              child: const Text('CONFIRM',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                  "https://img.freepik.com/premium-vector/thin-line-confirmation-email-logo-linear-flat-style-trend-modern-ui-logotype-graphic-button-design-isolated-white-background-concept-reminder-email-with-checkbox-reading-sms-popup_775815-556.jpg"),
            )
          ],
        ),
      ),
    );
  }
}
