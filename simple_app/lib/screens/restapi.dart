import 'package:flutter/material.dart';
import 'package:simple_app/models/usermodel.dart';
import 'package:simple_app/services/api.dart';

class Restapi extends StatefulWidget {
  const Restapi({super.key});

  @override
  State<Restapi> createState() => _RestapiState();
}

class _RestapiState extends State<Restapi> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override   
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rest API Example',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade400,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final gender = user.gender.toLowerCase();
          final genderColor = gender == 'male' ? Colors.blue : Colors.red;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: genderColor,
              child: Text(
                gender[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              user.name.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(user.location.timezone.description),
          );
        },
      ),
    );
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }
}
