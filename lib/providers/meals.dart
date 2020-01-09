import 'package:flutter/foundation.dart';
import '../models/meal_description.dart';

import '../models/meal.dart';

class Meals with ChangeNotifier {
  static List<MealDescription> description = [
    MealDescription(item: 'WEIGHT', info: 300, unit: 'G'),
    MealDescription(item: 'CALORIES', info: 267, unit: 'CAL'),
    MealDescription(item: 'VITAMINS', info: 'A, B6', unit: 'VIT'),
  ];
  List<Meal> _meals = [
    Meal(
        id: 0,
        imageUrl: 'assets/plate1.png',
        name: 'Salmon bowl',
        price: 24.00,
        consistsOf: description),
    Meal(
        id: 1,
        imageUrl: 'assets/plate2.png',
        name: 'Spring bowl',
        price: 22.00,
        consistsOf: description),
    Meal(
        id: 2,
        imageUrl: 'assets/plate6.png',
        name: 'Avocado bowl',
        price: 26.00,
        consistsOf: description),
    Meal(
        id: 3,
        imageUrl: 'assets/plate5.png',
        name: 'Berry bowl',
        price: 24.00,
        consistsOf: description),
  ];
  List<Meal> get meals {
    return _meals;
  }
}
