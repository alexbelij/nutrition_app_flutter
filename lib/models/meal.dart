import 'package:flutter/foundation.dart';
import './meal_description.dart';
class Meal {
  int id;
  String imageUrl;
  String name;
  double price;
  List<MealDescription> consistsOf;

  Meal({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.price,
    @required this.consistsOf
  });
}
