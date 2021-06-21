import 'package:app1/models/SocietyInfoItemModel.dart';
import 'package:flutter/widgets.dart';

class Catalog with ChangeNotifier {
  final String token;

  List<SocietyInfoItemModel> items = [];

  Catalog({
    required this.token,
  });

  List<SocietyInfoItemModel> get societyList => items;

  void setSocietyList(decodedData) {
    items = List.from(decodedData)
        .map<SocietyInfoItemModel>((item) => SocietyInfoItemModel.fromMap(item))
        .toList();
    notifyListeners();
  }
}
