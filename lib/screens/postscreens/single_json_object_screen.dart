import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/postprioviders/single_object_provider.dart';

class SingleObjectPostDataScreen extends StatefulWidget {
  const SingleObjectPostDataScreen({super.key});

  @override
  _SingleObjectPostDataScreenState createState() =>
      _SingleObjectPostDataScreenState();
}

class _SingleObjectPostDataScreenState
    extends State<SingleObjectPostDataScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Post Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isNotEmpty &&
                    _userIdController.text.isNotEmpty) {
                  final postData = {
                    'title': _titleController.text,
                    'userId': int.parse(_userIdController.text),
                  };

                  // Call the addPost method
                  await postProvider.addPost(postData);

                  // Check responseMessage and show a success message
                  if (postProvider.responseMessage?.contains('Success') ??
                      false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Clear TextFields
                    _titleController.clear();
                    _userIdController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Failed: ${postProvider.responseMessage}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Submit Post'),
            ),
            const SizedBox(height: 20),
            if (postProvider.isLoading)
              const CircularProgressIndicator()
            else if (postProvider.responseMessage != null)
              Text(postProvider.responseMessage!),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _userIdController.dispose();
    super.dispose();
  }
}
