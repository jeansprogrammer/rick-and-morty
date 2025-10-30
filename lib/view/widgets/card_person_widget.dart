import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/models/character_model.dart';
import 'package:rick_and_morty/view/pages/character_detail_page.dart';

class CardPersonWidget extends StatelessWidget {
  final CharacterModel character;

  const CardPersonWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetailPage(character: character))),
      child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    child: SizedBox(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        character.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 7),
                    child: Text(
                      character.name ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}