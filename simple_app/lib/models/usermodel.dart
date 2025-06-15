import 'package:simple_app/models/userlocation.dart';

class UserModel {
  final String gender;
  final NameModel name;
  final String email;
  final LocationModel location;
  UserModel({required this.gender, required this.name, required this.email,required this.location, required cell});
}

class NameModel {
  final String title;
  final String first;
  final String last;

  NameModel({required this.title, required this.first, required this.last});

  
  String get fullName => '$title $first $last';
}
