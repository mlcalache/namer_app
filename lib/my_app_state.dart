import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      removeFavorite(current);
    } else {
      addFavorite(current);
    }
  }

  void removeFavorite(WordPair value) {
    favorites.remove(value);
    notifyListeners();
  }

  void addFavorite(WordPair value) {
    favorites.add(value);
    notifyListeners();
  }
}
