import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  bool isLoading = false;
  String? responseMessage;

  Future<void> addPost(Map<String, dynamic> postData) async {
    final url = Uri.parse('https://dummyjson.com/posts/add');
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);
        responseMessage = 'Success: $decodedResponse';
      } else {
        responseMessage = 'Failed: ${response.statusCode}';
      }
    } catch (e) {
      responseMessage = 'Error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
