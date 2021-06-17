import 'package:dog_facts_app/providers/dog_fact_provider.dart';
import 'package:dog_facts_app/screens/detail_screen.dart';
import 'package:dog_facts_app/screens/favourite_screen.dart';
import 'package:dog_facts_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DogFactProvider()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          DetailScreen.routeName: (ctx) => DetailScreen(),
          FavouriteScreen.routName: (ctx) => FavouriteScreen(),
        },
      ),
    );
  }
}
