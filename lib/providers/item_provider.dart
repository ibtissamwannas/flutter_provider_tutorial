import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/items.dart';

class ItemProvider with ChangeNotifier {
  final List<Items> _items = [];

  List<Items> get items => UnmodifiableListView(_items);

  int get size => _items.length;

  void addItem(Items item) {
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(Items item) {
    _items.remove(item);
    notifyListeners();
  }

  void toggleItem(Items item) {
    item.toggle();
    notifyListeners();
  }
}
