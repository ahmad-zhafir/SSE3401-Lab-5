import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurant_foodly/models/additives_model.dart';

class FoodController extends GetxController{
  String _category = '';

  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
    print(category);
  }

  RxList<String> _types = <String>[].obs;
  List<String> get types => _types;
  set setTypes(String newValue) {
    _types.add(newValue);
  }

  int generateId() {
    int min = 0;
    int max = 1000;
    final _random = Random();
    return min + Random().nextInt(max - min);

  }

  RxList<Additive> _additivesList = <Additive>[].obs;
  List<Additive> get additivesList => _additivesList;
  set addAdditive(Additive newValue) {
    _additivesList.add(newValue);
  }

  void clearAdditives(){
    _additivesList.clear();

  }

}