import 'package:app1/models/SocietyInfoItemModel.dart';
import 'package:flutter/widgets.dart';

class Catalog with ChangeNotifier{
  List<SocietyInfoItemModel> items = [
  ];

  List<SocietyInfoItemModel> get societyList => items;
}
