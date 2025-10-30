import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/model/models/character_model.dart';

class CharacterRepository {
  final String baseUrl;

  const CharacterRepository({required this.baseUrl});

  Future<List<CharacterModel>> getAllCharacter() async {
    final response = await http.get(Uri.parse('$baseUrl/character'));

    final map = jsonDecode(response.body);

    final character = map['results'];

    final result =
      (character as List).map((c) => CharacterModel.fromJson(c)).toList();

    return result;
  }

}