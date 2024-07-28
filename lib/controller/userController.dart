import 'dart:convert'; // Import for json.decode
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/model/userModel.dart';

class UserController with ChangeNotifier {
  List<UserModel> _userModel = [];
  bool _isLoading = true;

  List<UserModel> get userModel {
    return [..._userModel];
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<void> getUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        // Decode the JSON response
        final List<dynamic> jsonData = json.decode(response.body);

        // Map the JSON list to a list of UserModel
        _userModel = jsonData.map((item) => UserModel.fromJson(item)).toList();

        log('User Model: $_userModel');
        _isLoading = false;

        notifyListeners(); // Notify listeners to update UI
      } else {
        _isLoading = false;
        notifyListeners(); // Notify listeners to update UI

        throw Exception('Failed to load users');
      }
    } catch (error) {
      log('Error fetching users: $error');
    }
  }
}
