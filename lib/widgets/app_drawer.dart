import 'package:dog_facts_app/screens/favourite_screen.dart';
import 'package:dog_facts_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Facts about Dogs'),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home_outlined),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Favourites'),
            leading: Icon(Icons.favorite),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FavouriteScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
