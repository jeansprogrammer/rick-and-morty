import 'package:rick_and_morty/model/models/character_model.dart';
import 'package:rick_and_morty/model/repository/character_repository.dart';

class HomeController {
   final CharacterRepository characterRepository;

   const HomeController({required this.characterRepository});

   Future<List<CharacterModel>> getAllCharacter() async {
    return await characterRepository.getAllCharacter();
   }
}