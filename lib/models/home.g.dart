// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      facts: (json['facts'] as List<dynamic>?)
          ?.map((e) => HomeFact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'facts': instance.facts,
    };
