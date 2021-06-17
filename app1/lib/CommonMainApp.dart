import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app1/common/MyRoutes.dart';
import 'package:app1/widgets/Home.dart';
import 'package:app1/widgets/alovipay/LoginScreenWidget.dart';
import 'package:app1/widgets/theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommonMainApp extends StatefulWidget {
  const CommonMainApp({
    Key? key,
  }) : super(key: key);

  @override
  _CommonMainAppState createState() => _CommonMainAppState();
}

class _CommonMainAppState extends State<CommonMainApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    loadAppLoadingPref();
    super.initState();
  }

  Future<void> loadAppLoadingPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: dotenv.env['APP_TITLE']!,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.firstPage,
      routes: {
        MyRoutes.firstPage: (context) => !_isLoggedIn ? AnimatedSplashScreen(
              splash: Image.asset(
                'assets/images/alovi_pay800_px.png',
              ),
              backgroundColor: Colors.blue.shade100,
              duration: 1000,
              nextScreen: LoginScreen(),
              splashTransition: SplashTransition.scaleTransition,
              splashIconSize: 400,
            ) : Home(),
        MyRoutes.homePage: (context) => Home(),
      },
    );
  }
}
