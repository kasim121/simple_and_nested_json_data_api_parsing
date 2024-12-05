import 'package:api_services/provider/getproviders/list_of_object_model_provider.dart';
import 'package:api_services/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/getproviders/nested_json_object_provider.dart';
import 'provider/getproviders/single_object_model_provider.dart';
import 'provider/postprioviders/single_object_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Get Provider
        ChangeNotifierProvider(create: (_) => ListOfObjectModelProvider()),
        ChangeNotifierProvider(create: (_) => SingleObjectProvider()),
        ChangeNotifierProvider(create: (_) => NestJsonObjectProvider()),

        //Post Provider
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
