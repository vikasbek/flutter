import 'dart:convert';
import 'dart:io';

import 'package:app1/models/http_exception.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _username;
  String? _email;
  String? _password;
  String? _token;
  DateTime? _expiryDate;

  String get token => _token!;

  Map<String, dynamic> toMap() {
    return {
      'username': _username,
      'email': _email,
      'password': _password,
      // 'token': token,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'User(username: $_username, email: $_email, password: $_password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Auth &&
        other._username == _username &&
        other._email == _email &&
        other._password == _password &&
        other.token == token;
  }

  @override
  int get hashCode {
    return _username.hashCode ^
        _email.hashCode ^
        _password.hashCode ^
        token.hashCode;
  }

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'username': username,
          'password': password,
        },
      );
      switch (response.statusCode) {
        case 200:
          final responseData = json.decode(response.body);
          if (responseData['error'] != null) {
            throw HttpException(responseData['error']['message']);
          }
          _token = responseData['token'];
          _expiryDate = DateTime.parse("2022-01-27");
          // _userId = responseData['localId'];
          // _expiryDate = DateTime.now().add(
          //   Duration(
          //     seconds: int.parse(
          //       responseData['expiresIn'],
          //     ),
          //   ),
          // );

          break;
        case 400:
          throw HttpException("Email/Mobile or password incorrect.");

        case 401:
          break;
        default:
          throw HttpException("Login failed!.");
      }
      notifyListeners();
    } on SocketException {
      throw HttpException("Login service down. Try again after some time.");
    } catch (error) {
      throw error;
    }
    // return User(username: "username", email: "email", password: "password", token: "token");
    // _token = "dsfjadere90afa90ak";
    // _expiryDate = DateTime.parse("2022-01-27");
    // Navigator.pushNamedAndRemoveUntil(
    //       context, MyRoutes.homePage, ModalRoute.withName(MyRoutes().firstPage));
  }

  bool isLoggedIn() {
    if (_token != null &&
        _token!.isNotEmpty &&
        _expiryDate != null &&
        _expiryDate!.isBefore(DateTime.now())) {
      return true;
    }
    return false;
  }
}
