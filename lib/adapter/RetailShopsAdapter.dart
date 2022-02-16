import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_assisment/constants/Constants.dart';
import 'package:flutter_assisment/models/shops.dart';
import 'package:hive/hive.dart';

class RetailShopsData extends ChangeNotifier {
  List<Shops> _items = [];

  UnmodifiableListView<Shops> get products => UnmodifiableListView(_items);

  getItemsList() async {
    Box<Shops> box = await Hive.openBox<Shops>(kProductsDataHiveBox);
    _items = box.values.toList();
    notifyListeners();
  }
}
