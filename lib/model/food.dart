import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String id;
  String name;
  String category;
  String image;
  List subIngradients;
  Timestamp createdAt;

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    subIngradients = data['subIngradients'];
    createdAt = data['createdAt'];
  }
}
