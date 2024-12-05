import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/getapismodels/3.nested_json_object_model.dart';

class NestJsonObjectProvider with ChangeNotifier {
  List<NestedJsonObjectModel> _users = [];
  bool _loading = false;
  bool _hasError = false;

  List<NestedJsonObjectModel> get users => _users;
  bool get loading => _loading;
  bool get hasError => _hasError;

  Future<void> fetchUsers() async {
    _loading = true;
    _hasError = false;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _users =
            data.map((json) => NestedJsonObjectModel.fromJson(json)).toList();
      } else {
        _hasError = true;
      }
    } catch (e) {
      _hasError = true;
    }

    _loading = false;
    notifyListeners();
  }
}
