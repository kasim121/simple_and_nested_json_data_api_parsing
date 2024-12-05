import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/getapismodels/1.list_of_object_model.dart';
import '../../provider/getproviders/list_of_object_model_provider.dart';

class ListOfObjectScreen extends StatefulWidget {
  const ListOfObjectScreen({super.key});

  @override
  _ListOfObjectScreenState createState() => _ListOfObjectScreenState();
}

class _ListOfObjectScreenState extends State<ListOfObjectScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch posts when the screen is initialized
    Provider.of<ListOfObjectModelProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Consumer<ListOfObjectModelProvider>(
        builder: (context, postProvider, _) {
          if (postProvider.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (postProvider.posts.isEmpty) {
            return const Center(child: Text('No posts available.'));
          }

          return ListView.builder(
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              ListOfObjectModelPost post = postProvider.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }
}
