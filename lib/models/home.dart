import 'package:json_annotation/json_annotation.dart';
import './home_fact.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  final int? id;
  final String? name;
  final String? imageUrl;
  final List<HomeFact>? facts;
  final String? videoUrl;
  Home({this.id, this.name, this.imageUrl, this.facts, this.videoUrl});

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}
