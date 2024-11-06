import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String name, details;
  DateTime dateTime;
  bool isdone;
  String id;
  TaskModel(
      {this.id = '',
      required this.name,
      required this.details,
      required this.dateTime,
      required this.isdone});
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            details: json['details'],
            dateTime: (json['dateTime'] as Timestamp).toDate(),
            isdone: json['isDone']);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'dateTime': Timestamp.fromDate(dateTime),
      'isDone': isdone
    };
  }
}
