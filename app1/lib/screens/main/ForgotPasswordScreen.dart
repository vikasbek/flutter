

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
        child: Center(
          child: Text("Forgot Screen",
            // style: TextStyle(),
          ),
        ),
      ),
    );
  }
}