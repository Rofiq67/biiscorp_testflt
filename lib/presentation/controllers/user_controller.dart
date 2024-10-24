// controllers/user_controller.dart
import 'dart:convert';
import 'package:flutter_tes_biiscrop/presentation/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<User> users = [];

      for (var user in jsonData['data']) {
        users.add(User.fromJson(user));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
