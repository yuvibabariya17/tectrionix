import 'package:hive/hive.dart';

part 'Model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime dueDate;

  @HiveField(3)
  String category;

  @HiveField(4)
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.category,
    this.isCompleted = false,
  });
}
