import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/getproviders/single_object_model_provider.dart';

class SingleObjectScreen extends StatefulWidget {
  @override
  _SingleObjectScreenState createState() => _SingleObjectScreenState();
}

class _SingleObjectScreenState extends State<SingleObjectScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the single post data when the screen is loaded
    Provider.of<SingleObjectProvider>(context, listen: false)
        .fetchSingleObject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Object')),
      body: Consumer<SingleObjectProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.hasError) {
            return Center(child: Text('Failed to load data.'));
          }

          if (provider.singleObjectModelPost != null) {
            final post = provider.singleObjectModelPost!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${post.title}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Body: ${post.body}', style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }

          return Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
