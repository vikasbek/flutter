import 'dart:io';

import 'package:app1/common/AlovipayConstants.dart';
import 'package:app1/common/MyRoutes.dart';
import 'package:app1/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _password;
  loginToHome(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      validateApiLogin(context);
    }
  }

  validateApiLogin(BuildContext context) async {
    _formKey.currentState!.save();

    Future<User> futureUser = Future(() => getUserTokenApi(context));
    
    futureUser.then((value) {    
      storeLoginPreference(value, context);
    });
  }

  Future<void> storeLoginPreference(User user, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AloviPaySharedPrefConstants.token, user.token!);
    await prefs.setBool(AloviPaySharedPrefConstants.isLoggedIn, true);
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/'),
        arguments: user);
  }

  Future<User> getUserTokenApi(BuildContext context) async {
    User _user = User.nonParameterConstructor();
    try {
      String? username = _username;
      String? password = _password;
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'username': username,
          'password': password,
        },
      );
      switch (response.statusCode) {
        case 200:
          _user = User.fromJson(response.body);
          Navigator.pushNamed(context, MyRoutes.homePage);
          break;

        case 400:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Email/Mobile or password invalid !')));
          break;
        case 401:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Access Denied !')));
          break;
        default:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong !')));
          break;
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error connecting to server !')));
    }
    // return User(username: "username", email: "email", password: "password", token: "token");
    return _user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.network(
              'https://images.unsplash.com/photo-1513364776144-60967b0f800f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1600&q=80',
              fit: BoxFit.cover,
              height: 230,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email or mobile";
                      }
                      return null;
                    },
                    onSaved: (value) => _username = value,
                    decoration: InputDecoration(
                      hintText: "Enter Email/Mobile",
                      labelText: "Email/Mobile",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: Key("_password"),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter valid password";
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => loginToHome(context),
                      style: TextButton.styleFrom(),
                      child: Text(
                        'Login',
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  // Future<User> getUserTokenApi(BuildContext context) {
  //   return new User(
  //       username: "username",
  //       email: "email",
  //       password: "password",
  //       token: "token");
  // }

  // Form buildForm(BuildContext context) {
  //   return
  // }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
