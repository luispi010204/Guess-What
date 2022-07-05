import 'dart:math';

import 'package:flutter/material.dart';

class Begriff extends ChangeNotifier {
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
    ];
  }

  List<String> get begriffe => List.unmodifiable(_begriffe);

  add(String neuerBegriff) {
    _begriffe.add(neuerBegriff);
    notifyListeners();
  }

  String get getBegriffe => _begriffe[Random().nextInt(begriffe.length)];
}
