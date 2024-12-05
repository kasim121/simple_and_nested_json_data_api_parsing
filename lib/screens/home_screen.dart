import 'package:flutter/material.dart';
import 'getscreens/list_of_object_screen.dart';
import 'getscreens/nested_json_object_screen.dart';
import 'getscreens/single_object_screen.dart';
import 'postscreens/single_json_object_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListOfObjectScreen()),
                );
              },
              child: const Text('View Posts List'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SingleObjectScreen()),
                );
              },
              child: const Text('View Single Post'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NestedJsonObjectScreen()),
                );
              },
              child: const Text('View Nested JsonObject'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleObjectPostDataScreen()),
                );
              },
              child: const Text('View SingleObjectPostDataScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
