import 'dart:collection';

import 'package:flutter/material.dart';

class AnimalCategoryModel {
  AnimalCategoryModel({
    this.isSelected = false,
    this.title,
    this.animalOutlineName,
  });
  bool isSelected;
  final String title;
  final String animalOutlineName;
  void selectAnimal() {
    isSelected = !isSelected;
  }
}

class AnimalsCatergory extends ChangeNotifier {
  List<AnimalCategoryModel> _animals = [
    AnimalCategoryModel(
      title: "Cats",
      animalOutlineName: "cat_outline.png",
      isSelected: true,
    ),
    AnimalCategoryModel(
      title: "Dogs",
      animalOutlineName: "dog_outline.png",
    ),
    AnimalCategoryModel(
      title: "Parrots",
      animalOutlineName: "parrots_outline.png",
    ),
    AnimalCategoryModel(
      title: "Bunnies",
      animalOutlineName: "rabbit_outline.png",
    ),
    AnimalCategoryModel(
      title: "Fish",
      animalOutlineName: "fish_outline.png",
    ),
  ];

  UnmodifiableListView<AnimalCategoryModel> get animals {
    return UnmodifiableListView(_animals);
  }

  int prevInedx = 0;
  bool isStarted = false;
  void selectAnimal(int index) {
    _animals[index].selectAnimal();
    if (!isStarted) {
      prevInedx = index;
      isStarted = true;
      _animals[0].selectAnimal();
    } else if (isStarted) {
      _animals[prevInedx].selectAnimal();
      prevInedx = index;
    }
    notifyListeners();
  }
}
