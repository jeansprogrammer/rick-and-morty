import 'package:rick_and_morty/model/models/location_model.dart';
import 'package:rick_and_morty/model/models/origin_model.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginModel? origin;
  final LocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  const CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  static CharacterModel fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: OriginModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }
}
