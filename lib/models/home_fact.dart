import 'package:json_annotation/json_annotation.dart';

part 'home_fact.g.dart';

@JsonSerializable()
class HomeFact {
  final String? title;
  final String? text;
  HomeFact({this.title, this.text});

  factory HomeFact.fromJson(Map<String, dynamic> json) =>
      _$HomeFactFromJson(json);
}
