import 'package:app1/common/MyRoutes.dart';
import 'package:app1/models/User.dart';
import 'package:app1/screens/main/ForgotPasswordScreen.dart';
import 'package:app1/screens/main/SignUpScreen.dart';
import 'package:app1/widgets/Home.dart';
import 'package:app1/widgets/alovipay/AppLoadingSplashScreenWidget.dart';
import 'package:app1/widgets/theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommonMainApp extends StatefulWidget {
  const CommonMainApp({
    Key? key,
  }) : super(key: key);

  @override
  _CommonMainAppState createState() => _CommonMainAppState();
}

class _CommonMainAppState extends State<CommonMainApp> {
  // bool _isLoggedIn = false;

  // @override
  // void initState() {
  //   super.initState();
  //   loadAppLoadingPref();
  // }

  // Future<void> loadAppLoadingPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = (prefs.getBool(AloviPaySharedPrefConstants.isLoggedIn) !=null && prefs.getBool(AloviPaySharedPrefConstants.isLoggedIn)!  && prefs.getString(AloviPaySharedPrefConstants.token) != null && prefs.getString(AloviPaySharedPrefConstants.token)!.isNotEmpty) ? true : false;
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value:User.nonParameterConstructor(),
        ),
      ],
          child: Consumer<User>(
            builder: (_, auth, __)=> MaterialApp(
              title: dotenv.env['APP_TITLE']!,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              theme: MyTheme.lightTheme(context),
              darkTheme: MyTheme.darkTheme(context),
              initialRoute: MyRoutes.firstPage,
              routes: {
                  MyRoutes.firstPage: (context) => AppLoadingSplashScreen(),
                  MyRoutes.homePage: (context) => Home(),
                  MyRoutes.signUpPage: (context) => SignUpScreen(),
                  MyRoutes.forgotPasswordPage: (context) => ForgotPasswordScreen(),

              },
            ),
          ),
    );
  }
}
