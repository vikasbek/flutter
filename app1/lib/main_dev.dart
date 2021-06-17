import 'package:app1/CommonMainApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

Future main() async {
  await dotenv.load(fileName: "assets/env/.env_dev");
  //Widget widget = Platform.isIOS?CupertinoApp() : MaterialApp();
  setPathUrlStrategy();
  runApp(CommonMainApp());
}
