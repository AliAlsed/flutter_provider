import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproveder/model/food.dart';
import 'package:flutterproveder/notifier/food_notifier.dart';

getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot querySnapshot =
      await Firestore.instance.collection('foods').getDocuments();
  List<Food> _foodList = [];

  querySnapshot.documents.forEach((document) {
    Food food = Food.fromMap(document.data);
    _foodList.add(food);
  });

  foodNotifier.foodList = _foodList;
}
