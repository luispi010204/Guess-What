import 'dart:math';

import 'package:flutter/material.dart';

class Begriffe extends ChangeNotifier {
  late List<String> _begriffe;

  Begriffe() {
    _begriffe = [
      "the Rock",
      "Justin Biber",
      "Oprah Winfield",
      "Jennifer Lopez",
      "Donald Trump",
      "Will Smith",
      "Elon Musk",
      "Cristiano Ronaldo",
      "Tiger Woods",
      "Lebron James",
      "Lionel Messi",
      "Rihanna",
      "Taylor Swift",
      "Eminem",
      "James Bond",

    ];
  }

  List<String> get getListeBegriffe => List.unmodifiable(_begriffe);

  add(String neuerBegriff) {
    _begriffe.add(neuerBegriff);
    notifyListeners();
  }

  String get getBegriffe => _begriffe[Random().nextInt(getListeBegriffe.length)];
}
