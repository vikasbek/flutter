import 'package:app1/common/MyRoutes.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Text(
                "Forgot Password",
                // style: TextStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Enter Email/Mobile',
                        labelText: 'Email/Mobile',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.otpVerification);
                      },
                      style: TextButton.styleFrom(),
                      child: Text(
                        'Submit',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
