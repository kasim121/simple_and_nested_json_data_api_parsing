import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/getapismodels/2.single_object_model.dart';

class SingleObjectProvider extends ChangeNotifier {
  SingleObjectModelPost? _singleObjectModelPost;
  bool _loading = false;
  bool _hasError = false;

  SingleObjectModelPost? get singleObjectModelPost => _singleObjectModelPost;
  bool get loading => _loading;
  bool get hasError => _hasError;

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<void> fetchSingleObject() async {
    _loading = true;
    _hasError = false;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> singleMapObject = json.decode(response.body);
        _singleObjectModelPost =
            SingleObjectModelPost.fromJson(singleMapObject);
      } else {
        _hasError = true;
      }
    } catch (error) {
      _hasError = true;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
