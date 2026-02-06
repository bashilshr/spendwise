import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int colorValue;

  @HiveField(3)
  final int iconCode;

  CategoryModel({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.iconCode,
  });

  Color get color => Color(colorValue);
  IconData get icon => IconData(iconCode, fontFamily: 'MaterialIcons');
}
