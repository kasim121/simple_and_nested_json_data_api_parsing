import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/getapismodels/1.list_of_object_model.dart';

class ListOfObjectModelProvider with ChangeNotifier {
  List<ListOfObjectModelPost> _posts = [];
  bool _loading = false;

  List<ListOfObjectModelPost> get posts => _posts;
  bool get loading => _loading;

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> fetchPosts() async {
    _loading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(baseUrl));

      debugPrint("Api Response0000:  ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        debugPrint("Api Response111:  $data");

        _posts = data
            .map((postData) => ListOfObjectModelPost.fromJson(postData))
            .toList();
        debugPrint("Api Response2222:  ${_posts.first.body}");
        for (var post in _posts) {
          print("post length ${post.id}");
        }
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      print("Error fetching posts: $error");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
