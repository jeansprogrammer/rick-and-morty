import 'package:flutter/material.dart';
import 'package:rick_and_morty/controller/favorite_controller.dart';
import 'package:rick_and_morty/view/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final favoriteController = FavoriteController();

  favoriteController.loadFavorites();

  runApp(MyApp(favoriteController: favoriteController));
}
