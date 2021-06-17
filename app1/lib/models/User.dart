import 'dart:convert';

class User {
  String? username;
  String? email;
  String? password;
  String? token;
  User.nonParameterConstructor();

  User({
    this.username,
    required this.email,
    required this.password,
    required this.token,
  });

  User copyWith({
    String? username,
    String? email,
    String? password,
    String? token,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, email: $email, password: $password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.token == token;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode;
  }
}
