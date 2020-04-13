import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterproveder/model/food.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _selectedFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);

  Food get selectedFood => _selectedFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set selectedFood(Food selectedFood) {
    _selectedFood = selectedFood;

    notifyListeners();
  }
}
