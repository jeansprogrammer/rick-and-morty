import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FavoriteController {
  List<int> favoritesCharacterIds = [];
  final file = File('../../assets/favorite.json');

  void loadFavorites() async {
    //final content = await file.readAsString();
    final String content = await rootBundle.loadString('assets/favorite.json');

    final result = jsonDecode(content);

    favoritesCharacterIds = List<int>.from(result);
  }

  void addFavorite(int? id){
    if (id != null) {
      favoritesCharacterIds.add(id);
    }
  }

  void removeFavorite(int? id){
    if (id != null) {
      favoritesCharacterIds.remove(id);
    }
  }

  void updateFile(){
    //rootBundle.('assets/favorite.json');
  }
}