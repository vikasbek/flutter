import 'dart:convert';

import 'package:collection/collection.dart';

class SocietyInfoItemModel {

  final String societyId;
  final String societyName;
  final String societyDisplayName;
  final String societyShortName;
  final String societyLogo;
  final String societyAddress;
  final String societyMobile;
  final String societyEmail;
  final List<dynamic> societyDescription;
  final List<dynamic> societyTermsCondition;
  SocietyInfoItemModel({
    required this.societyId,
    required this.societyName,
    required this.societyDisplayName,
    required this.societyShortName,
    required this.societyLogo,
    required this.societyAddress,
    required this.societyMobile,
    required this.societyEmail,
    required this.societyDescription,
    required this.societyTermsCondition,
  });

  SocietyInfoItemModel copyWith({
    String? societyId,
    String? societyName,
    String? societyDisplayName,
    String? societyShortName,
    String? societyLogo,
    String? societyAddress,
    String? societyMobile,
    String? societyEmail,
    List<dynamic>? societyDescription,
    List<dynamic>? societyTermsCondition,
  }) {
    return SocietyInfoItemModel(
      societyId: societyId ?? this.societyId,
      societyName: societyName ?? this.societyName,
      societyDisplayName: societyDisplayName ?? this.societyDisplayName,
      societyShortName: societyShortName ?? this.societyShortName,
      societyLogo: societyLogo ?? this.societyLogo,
      societyAddress: societyAddress ?? this.societyAddress,
      societyMobile: societyMobile ?? this.societyMobile,
      societyEmail: societyEmail ?? this.societyEmail,
      societyDescription: societyDescription ?? this.societyDescription,
      societyTermsCondition: societyTermsCondition ?? this.societyTermsCondition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'societyId': societyId,
      'societyName': societyName,
      'societyDisplayName': societyDisplayName,
      'societyShortName': societyShortName,
      'societyLogo': societyLogo,
      'societyAddress': societyAddress,
      'societyMobile': societyMobile,
      'societyEmail': societyEmail,
      'societyDescription': societyDescription,
      'societyTermsCondition': societyTermsCondition,
    };
  }

  factory SocietyInfoItemModel.fromMap(Map<String, dynamic> map) {
    return SocietyInfoItemModel(
      societyId: map['societyId'],
      societyName: map['societyName'],
      societyDisplayName: map['societyDisplayName'],
      societyShortName: map['societyShortName'],
      societyLogo: map['societyLogo'],
      societyAddress: map['societyAddress'],
      societyMobile: map['societyMobile'],
      societyEmail: map['societyEmail'],
      societyDescription: List<dynamic>.from(map['societyDescription']),
      societyTermsCondition: List<dynamic>.from(map['societyTermsCondition']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SocietyInfoItemModel.fromJson(String source) => SocietyInfoItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SocietyInfoItemModel(societyId: $societyId, societyName: $societyName, societyDisplayName: $societyDisplayName, societyShortName: $societyShortName, societyLogo: $societyLogo, societyAddress: $societyAddress, societyMobile: $societyMobile, societyEmail: $societyEmail, societyDescription: $societyDescription, societyTermsCondition: $societyTermsCondition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is SocietyInfoItemModel &&
      other.societyId == societyId &&
      other.societyName == societyName &&
      other.societyDisplayName == societyDisplayName &&
      other.societyShortName == societyShortName &&
      other.societyLogo == societyLogo &&
      other.societyAddress == societyAddress &&
      other.societyMobile == societyMobile &&
      other.societyEmail == societyEmail &&
      listEquals(other.societyDescription, societyDescription) &&
      listEquals(other.societyTermsCondition, societyTermsCondition);
  }

  @override
  int get hashCode {
    return societyId.hashCode ^
      societyName.hashCode ^
      societyDisplayName.hashCode ^
      societyShortName.hashCode ^
      societyLogo.hashCode ^
      societyAddress.hashCode ^
      societyMobile.hashCode ^
      societyEmail.hashCode ^
      societyDescription.hashCode ^
      societyTermsCondition.hashCode;
  }
}