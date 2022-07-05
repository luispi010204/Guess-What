import 'dart:math';

import 'package:flutter/material.dart';

class Begriffe extends ChangeNotifier {
  late List<String> _begriffe;

  Begriffe() {
    _begriffe = [
      "Hund",
      "Warteraum",
      "Zentrum",
      "Kind",
      "Elternteil",
      "Gehirn",
      "Aufnahmegerät",
      "Wangenknochen",
      "Welle",
      "Stier",
      "Geist",
      "Computer",
      "Fenster",
      "Stein",
      "Gorilla",

    ];
  }

  List<String> get getListeBegriffe => List.unmodifiable(_begriffe);

  add(String neuerBegriff) {
    _begriffe.add(neuerBegriff);
    notifyListeners();
  }

  String get getBegriffe => _begriffe[Random().nextInt(getListeBegriffe.length)];
}
