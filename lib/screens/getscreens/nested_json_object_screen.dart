import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/getproviders/nested_json_object_provider.dart';

class NestedJsonObjectScreen extends StatefulWidget {
  @override
  _NestedJsonObjectScreenState createState() => _NestedJsonObjectScreenState();
}

class _NestedJsonObjectScreenState extends State<NestedJsonObjectScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the users when the screen is initialized
    Provider.of<NestJsonObjectProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Consumer<NestJsonObjectProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userProvider.hasError) {
            return Center(child: Text('Failed to load users.'));
          }

          if (userProvider.users.isEmpty) {
            return Center(child: Text('No users available.'));
          }

          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              var user = userProvider.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  // Navigate to another screen if needed
                },
              );
            },
          );
        },
      ),
    );
  }
}
