import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_app/models/userlocation.dart';
import '../models/usermodel.dart';

class UserApi {
  static Future<List<UserModel>> fetchUser() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    
    // HTTP GET request
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    
    final users = results.map((e) {
      final name = NameModel(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      
      final street = StreetModel(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']);
      
      final coordinate = CoOrdinateModel(
          latitude: double.parse(e['location']['coordinates']['latitude']),
          longitude: double.parse(e['location']['coordinates']['longitude']));
      
      final timezone = TimeZoneModel(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);
      
      final location = LocationModel(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          
          street: street,
          coordinate: coordinate,
          timezone: timezone);
      
      return UserModel(
          cell:e['cell'],
          gender: e['gender'],
          name: name, 
          email: e['email'],
          location: location);
    }).toList();
    
    return users;
  }
}
